import 'package:tirtik_app/app/models/exchange_info.dart';
import 'package:tirtik_app/app/repositories/response.dart';

Future<void> main() async {
  late final ExchangeInfoModel exchangeInfoModel;

  final List<String> assets = <String>[];
  final List<String> temp = <String>[];

  try {
    exchangeInfoModel = await HttpResponse.getExchangeInfo();
    print(exchangeInfoModel.symbols![0].baseAsset!);
  } catch (e) {
    print(e);
    rethrow;
  }

  if (exchangeInfoModel.symbols!.isNotEmpty) {
    for (var element in exchangeInfoModel.symbols!) {
      if (element.quoteAsset == 'USDT' || element.quoteAsset == 'BUSD') {
        if (element.permissions!.where((b) => b == 'SPOT').isNotEmpty) {
          if (element.isSpotTradingAllowed! == true && element.isMarginTradingAllowed == false) {
            temp.add(element.baseAsset!);
          }
        }
      }
    }
  }

  //Çifti birden fazla bulunan
  if (temp.isNotEmpty) {
    for (var element in temp) {
      final count = temp.where((b) => b == element).toList();
      if (count.length > 1) {
        assets.add(element);
      }
    }
    assets.toSet();
  }

  print(assets.length);
}
