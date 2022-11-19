import 'package:flutter_test/flutter_test.dart';
import 'package:tirtik_app/app/extension/general_extension.dart';
import 'package:tirtik_app/app/models/exchange_info.dart';
import 'package:tirtik_app/app/repositories/general.dart';

main() {
  test('Get ExchangeInfo Test', () async {
    final response = await GeneralRepositories().getExchangeInfo();
    expect(response.status.isOk, true);
    expect(response.data is ExchangeInfoModel, true);
  });
}
