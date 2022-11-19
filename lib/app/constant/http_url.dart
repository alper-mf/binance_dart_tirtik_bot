class AppHttpUrl {
  static const String baseURL = 'https://api.binance.com';
  static const String socketUrl = 'wss://stream.binance.com:9443/ws';

  static const String testPing = '/api/v3/ping';
  static const String testCheckServerTime = '/api/v3/time';
  static const String getExchangeInfo = '/api/v3/exchangeInfo';
}
