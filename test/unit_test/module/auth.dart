/* import 'package:flutter_test/flutter_test.dart';
import 'package:margincoins/app/bl/general.dart';
import 'package:margincoins/app/extensions/general_extension.dart';
import 'package:margincoins/app/model/response/auth/get_user_info.dart';
import 'package:margincoins/app/model/response/auth/login_response.dart';

import '../model/unit_test_model.dart';

void main() {
  String transId = '';
  test('getOtp test', () async {
    final response = await General().getOtp(UnitTestModel.instance.getOtpBody);
    expect(response.status.isOk, true);
    expect(response.data is LoginResponse, true);
    response.data!.transactionId != null ? transId = response.data!.transactionId! : transId = '';
  });

  test('sendOtp test', () async {
    final response = await General().sendOtp(UnitTestModel.instance.sendOtpBody(transId));
    expect(response.status.isOk, true);
    expect(response.data is GetUserInfoModel, true);
    UnitTestModel.instance.sessionController.setUserToken(response.data!.token!);
  });
}
 */