// To parse this JSON data, do
//
//     final pairModel = pairModelFromJson(jsonString);

import 'dart:convert';

PairModel pairModelFromJson(String str) => PairModel.fromJson(json.decode(str));

String pairModelToJson(PairModel data) => json.encode(data.toJson());

class PairModel {
  PairModel({
    this.pairModelE,
    this.e,
    this.s,
    this.pairModelT,
    this.p,
    this.q,
    this.b,
    this.a,
    this.t,
    this.pairModelM,
    this.m,
  });

  String? pairModelE;
  int? e;
  String? s;
  int? pairModelT;
  String? p;
  String? q;
  int? b;
  int? a;
  int? t;
  bool? pairModelM;
  bool? m;

  factory PairModel.fromJson(Map<String, dynamic> json) => PairModel(
        pairModelE: json["e"],
        e: json["E"],
        s: json["s"],
        pairModelT: json["t"],
        p: json["p"],
        q: json["q"],
        b: json["b"],
        a: json["a"],
        t: json["T"],
        pairModelM: json["m"],
        m: json["M"],
      );

  Map<String, dynamic> toJson() => {
        "e": pairModelE,
        "E": e,
        "s": s,
        "t": pairModelT,
        "p": p,
        "q": q,
        "b": b,
        "a": a,
        "T": t,
        "m": pairModelM,
        "M": m,
      };
}
