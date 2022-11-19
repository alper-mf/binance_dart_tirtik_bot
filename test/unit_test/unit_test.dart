import 'package:flutter_test/flutter_test.dart';

import 'model/unit_test_model.dart';
import 'module/splash.dart' as splash;

/// flutter run --trace-startup --profile
void main() {
  setUpAll(() async {
    UnitTestModel.instance.init();
  });

  group('Splash Screen Test', () {
    splash.main();
  });
}
