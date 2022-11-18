// To parse this JSON data, do
//
//     final exchangeInfoModel = exchangeInfoModelFromJson(jsonString);

import 'dart:convert';

ExchangeInfoModel exchangeInfoModelFromJson(String str) => ExchangeInfoModel.fromJson(json.decode(str));

String exchangeInfoModelToJson(ExchangeInfoModel data) => json.encode(data.toJson());

class ExchangeInfoModel {
  ExchangeInfoModel({
    this.timezone,
    this.serverTime,
    this.rateLimits,
    this.exchangeFilters,
    this.symbols,
  });

  String? timezone;
  int? serverTime;
  List<RateLimit>? rateLimits;
  List<dynamic>? exchangeFilters;
  List<Symbol>? symbols;

  factory ExchangeInfoModel.fromJson(Map<String, dynamic> json) => ExchangeInfoModel(
        timezone: json["timezone"],
        serverTime: json["serverTime"],
        rateLimits: List<RateLimit>.from(json["rateLimits"].map((x) => RateLimit.fromJson(x))),
        exchangeFilters: List<dynamic>.from(json["exchangeFilters"].map((x) => x)),
        symbols: List<Symbol>.from(json["symbols"].map((x) => Symbol.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "timezone": timezone,
        "serverTime": serverTime,
        "rateLimits": List<dynamic>.from(rateLimits!.map((x) => x.toJson())),
        "exchangeFilters": List<dynamic>.from(exchangeFilters!.map((x) => x)),
        "symbols": List<dynamic>.from(symbols!.map((x) => x.toJson())),
      };
}

class RateLimit {
  RateLimit();

  factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit();

  Map<String, dynamic> toJson() => {};
}

class Symbol {
  Symbol({
    this.symbol,
    this.status,
    this.baseAsset,
    this.baseAssetPrecision,
    this.quoteAsset,
    this.quotePrecision,
    this.quoteAssetPrecision,
    this.orderTypes,
    this.icebergAllowed,
    this.ocoAllowed,
    this.quoteOrderQtyMarketAllowed,
    this.allowTrailingStop,
    this.cancelReplaceAllowed,
    this.isSpotTradingAllowed,
    this.isMarginTradingAllowed,
    this.filters,
    this.permissions,
  });

  String? symbol;
  String? status;
  String? baseAsset;
  int? baseAssetPrecision;
  String? quoteAsset;
  int? quotePrecision;
  int? quoteAssetPrecision;
  List<String>? orderTypes;
  bool? icebergAllowed;
  bool? ocoAllowed;
  bool? quoteOrderQtyMarketAllowed;
  bool? allowTrailingStop;
  bool? cancelReplaceAllowed;
  bool? isSpotTradingAllowed;
  bool? isMarginTradingAllowed;
  List<dynamic>? filters;
  List<String>? permissions;

  factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        symbol: json["symbol"],
        status: json["status"],
        baseAsset: json["baseAsset"],
        baseAssetPrecision: json["baseAssetPrecision"],
        quoteAsset: json["quoteAsset"],
        quotePrecision: json["quotePrecision"],
        quoteAssetPrecision: json["quoteAssetPrecision"],
        orderTypes: List<String>.from(json["orderTypes"].map((x) => x)),
        icebergAllowed: json["icebergAllowed"],
        ocoAllowed: json["ocoAllowed"],
        quoteOrderQtyMarketAllowed: json["quoteOrderQtyMarketAllowed"],
        allowTrailingStop: json["allowTrailingStop"],
        cancelReplaceAllowed: json["cancelReplaceAllowed"],
        isSpotTradingAllowed: json["isSpotTradingAllowed"],
        isMarginTradingAllowed: json["isMarginTradingAllowed"],
        filters: List<dynamic>.from(json["filters"].map((x) => x)),
        permissions: List<String>.from(json["permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "status": status,
        "baseAsset": baseAsset,
        "baseAssetPrecision": baseAssetPrecision,
        "quoteAsset": quoteAsset,
        "quotePrecision": quotePrecision,
        "quoteAssetPrecision": quoteAssetPrecision,
        "orderTypes": List<dynamic>.from(orderTypes!.map((x) => x)),
        "icebergAllowed": icebergAllowed,
        "ocoAllowed": ocoAllowed,
        "quoteOrderQtyMarketAllowed": quoteOrderQtyMarketAllowed,
        "allowTrailingStop": allowTrailingStop,
        "cancelReplaceAllowed": cancelReplaceAllowed,
        "isSpotTradingAllowed": isSpotTradingAllowed,
        "isMarginTradingAllowed": isMarginTradingAllowed,
        "filters": List<dynamic>.from(filters!.map((x) => x)),
        "permissions": List<dynamic>.from(permissions!.map((x) => x)),
      };
}
