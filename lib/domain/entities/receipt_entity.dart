import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
class ReceiptEntity {
  int qty;
  String item;
  double price;
  late double total;

  ReceiptEntity({
    this.qty = 0,
    this.item = "",
    this.price = 0,
  }) {
    total = qty * price;
  }
}
