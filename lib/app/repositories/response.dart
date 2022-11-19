import 'package:tirtik_app/app/extension/general_extension.dart';
import 'package:tirtik_app/app/repositories/general.dart';

import '../models/exchange_info.dart';

class HttpResponse {
  static Future getExchangeInfo() async {
    final response = await GeneralRepositories().getExchangeInfo();
    if (response.status.isOk) {
      final ExchangeInfoModel model = response.data!;
      return model;
    }
  }
}
