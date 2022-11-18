import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tirtik_app/app/constant/http_url.dart';
import 'package:tirtik_app/app/models/base_http_model.dart';
import 'package:tirtik_app/app/models/exchange_info.dart';

import '../constant/loading_status_enum.dart';

class GeneralRepositories {
  Future<BaseHttpModel<ExchangeInfoModel>> getExchangeInfo() async {
    final response = await http.get(Uri.parse(AppHttpUrl.baseURL + AppHttpUrl.getExchangeInfo));

    if (response.statusCode == HttpStatus.ok) {
      final model = ExchangeInfoModel.fromJson(jsonDecode(response.body));
      return BaseHttpModel<ExchangeInfoModel>(status: BaseModelStatus.Ok, data: model);
    } else {
      return BaseHttpModel(status: BaseModelStatus.Error, message: 'Hata');
    }
  }
}
