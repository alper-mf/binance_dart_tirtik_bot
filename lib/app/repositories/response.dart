<<<<<<<< HEAD:lib/app/repositories/response.dart
========
import 'package:flutter_test/flutter_test.dart';
>>>>>>>> e43aa689ae90482e28feb83b8f06e8d6e181d00c:test/unit_test/module/splash.dart
import 'package:tirtik_app/app/extension/general_extension.dart';
import 'package:tirtik_app/app/models/exchange_info.dart';
import 'package:tirtik_app/app/repositories/general.dart';

class HttpResponse {
  static Future getExchangeInfo() async {
    final response = await GeneralRepositories().getExchangeInfo();
    if (response.status.isOk) {
      final ExchangeInfoModel model = response.data!;
      return model;
    }
  }
}
