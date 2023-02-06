import 'dart:convert';

import 'package:flutter/foundation.dart';

class PaymentModel {

  String id;
  String paymentId;
  String amount;
  String status;
  int createdAt;
  List cart;
  PaymentModel({
    this.id,
    this.paymentId,
    this.amount,
    this.status,
    this.createdAt,
    this.cart,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] ?? '',
      paymentId: map['paymentId'] ?? '',
      amount: map['amount'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['createdAt']?.toInt() ?? 0,
      cart: List.from(map['cart']),
    );
  }

}
