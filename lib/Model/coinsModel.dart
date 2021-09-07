// To parse this JSON data, do
//
//     final coins = coinsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Coins coinsFromJson(String str) => Coins.fromJson(json.decode(str));

String coinsToJson(Coins data) => json.encode(data.toJson());

class Coins {
  Coins({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<Datum> data;

  factory Coins.fromJson(Map<String, dynamic> json) => Coins(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.planName,
    required this.totalCoin,
    required this.amount,
  });

  String planName;
  String totalCoin;
  String amount;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        planName: json["plan_name"],
        totalCoin: json["total_coin"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "plan_name": planName,
        "total_coin": totalCoin,
        "amount": amount,
      };
}
