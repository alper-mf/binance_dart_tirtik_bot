import 'package:flutter_test/flutter_test.dart';
import 'module/home.dart' as home;

/// flutter run --trace-startup --profile
void main() {
  setUpAll(() async {
    // UnitTestModel.instance.init();
  });

  group('Home Screen Test', () {
    home.main();
  });
}
