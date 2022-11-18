/* import 'package:flutter_test/flutter_test.dart';
import 'package:margincoins/app/bl/general.dart';
import 'package:margincoins/app/extensions/general_extension.dart';

import 'package:margincoins/app/model/response/auth/user_info_model.dart';
import 'package:margincoins/app/model/response/courier_break/break_status.dart';
import 'package:margincoins/app/model/response/shift/shift_status_model.dart';

void main() {
  test('getUserInfo test', () async {
    final response = await General().getUserInfo();
    expect(response.status.isOk, true);
    expect(response.data is UserInfoModel, true);
  });

  test('Courirer State test', () async {
    final response = await General().getState();
    expect(response.status.isOk, true);
    expect(response.data is ShiftStatusModel, true);
  });

  test('Courirer Break Status test', () async {
    final response = await General().getCourierBreakStatus();
    expect(response.status.isOk, true);
    expect(response.data is CouirerBreakStatusResponse, true);
  });

  test('Courirer Break Start test', () async {
    final response = await General().courierBreakStart();
    expect(response.status.isOk, true);
    expect(response.data is CouirerBreakStatusResponse, true);
  });

  test('Courirer Break Stop test', () async {
    final response = await General().courierBreakStop();
    expect(response.status.isOk, true);
    expect(response.data is CouirerBreakStatusResponse, true);
  });
}
 */