class UnitTestModel {
  static final _instance = UnitTestModel._();
  UnitTestModel._();
  static UnitTestModel get instance => _instance;

  init() async {
    /*   SharedPreferences.setMockInitialValues({});
    SharedPreferences pref = await SharedPreferences.getInstance();
    LocaleManager.cacheInit(pref);
    // await _instance.sessionController.setSessionId(const Uuid().v4());
    DopLogger.init('', false, false, (() {
      return;
    })); */
  }
}
