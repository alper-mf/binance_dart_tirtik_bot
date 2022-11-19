import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tirtik_app/app/constant/http_url.dart';
import 'package:tirtik_app/app/models/pair_model.dart';
import '../../../app/models/exchange_info.dart';
import '../../../app/repositories/response.dart';
import 'package:web_socket_channel/io.dart';

class HomeController extends GetxController {
  late final ExchangeInfoModel exchangeInfoModel;
  RxList<AssetSymbol> assetsList = <AssetSymbol>[].obs;
  List<String> socketList = <String>[];
  final IOWebSocketChannel channel = IOWebSocketChannel.connect(AppHttpUrl.socketUrl);
  late StreamSubscription subscription;

  Future getExchangeInfoModel() async {
    final List<String> temp = <String>[];
    final List<String> settedTemp = <String>[];
    try {
      exchangeInfoModel = await HttpResponse.getExchangeInfo();

      if (exchangeInfoModel.symbols != null) {
        if (exchangeInfoModel.symbols!.isNotEmpty) {
          for (var element in exchangeInfoModel.symbols!) {
            if (element.status == 'TRADING') {
              if (element.permissions!.where((b) => b == 'SPOT').isNotEmpty) {
                if (element.quoteAsset == 'BUSD') {
                  if (element.isSpotTradingAllowed! == true && element.isMarginTradingAllowed == false) {
                    temp.add(element.baseAsset!);
                  }
                }
              }
            }
          }
        }

        //Çifti birden fazla bulunan
        if (temp.isNotEmpty) {
          for (var element in temp) {
            final count = temp.where((b) => b == element).toList();
            if (count.length == 1) {
              settedTemp.add(element);
            }
          }
          settedTemp.toSet();
        }

        if (settedTemp.isNotEmpty) {
          for (var element in settedTemp) {
            final item = exchangeInfoModel.symbols!.indexWhere((b) => b.baseAsset == element);
            if (item > 0) {
              assetsList.add(exchangeInfoModel.symbols![item]);
            }
          }
        }

        if (assetsList.isNotEmpty) {
          for (var element in assetsList.value) {
            final list = [
              "${element.baseAsset!.toLowerCase()}usdt@trade",
              "${element.baseAsset!.toLowerCase()}busd@trade"
            ];
            socketList.addAll(list);
          }
        }

        if (socketList.isNotEmpty) {
          streamListener();
        }

        debugPrint('${assetsList.length} ${socketList.length}');
      }
    } catch (e) {
      rethrow;
    }
  }

  streamListener() {
    debugPrint('OrderBook Socket Başlatıldı');
    channel.sink.add('{"method": "SUBSCRIBE", "params":${jsonEncode(socketList)},"id": 1}');

    // channel.sink.add('{"method": "SUBSCRIBE", "params":["eurusdt@trade", "eurbusd@trade"],"id": 1}');

    try {
      subscription = channel.stream.listen((message) async {
        final model = PairModel.fromJson(jsonDecode(message));
        updateAssetsList(model);
      });
      update(['home']);
    } catch (e) {
      debugPrint('----> $e');
      subscription.cancel();
      channel.sink.close();
      rethrow;
    }
  }

  updateAssetsList(PairModel model) {
    if (model.s != null) {
      //  print(model.s!.substring(0, model.s!.length - 4));
      // print(model.s!.substring(model.s!.length - 4));
      final baseAsset = model.s!.substring(0, model.s!.length - 4);
      final quoteAsset = model.s!.substring(model.s!.length - 4);
      if (assetsList.isNotEmpty) {
        final indis = assetsList.indexWhere((b) => b.baseAsset == baseAsset);
        if (indis >= 0) {
          final item = assetsList[indis];
          final price = double.parse(model.p!).toStringAsFixed(item.baseAssetPrecision!);
          if (quoteAsset == 'USDT') {
            item.usdtPrice = price;
            assetsList.firstRebuild;
          } else {
            item.busdPrice = price;
            assetsList.firstRebuild;
          }

          if (item.usdtPrice != null && item.busdPrice != null) {
            final prices = [double.parse(item.usdtPrice!), double.parse(item.busdPrice!)];
            prices.sort();

            final pc = ((prices[1] - prices[0]) / prices[1]) * 100;
            item.percentChange = pc;

            assetsList.sort((p1, p2) => Comparable.compare(p2.percentChange ?? 0.0, p1.percentChange ?? 0.0));
            assetsList.firstRebuild;

            if (pc.roundToDouble() > 1) {}
          }
        }
      }
    }

    // assetsList.refresh();
    update(['homeUpdate']);
  }

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      getExchangeInfoModel(),
    ]);
  }

  @override
  void onClose() {
    super.onClose();
    subscription.cancel();
    channel.sink.close();
  }
}
