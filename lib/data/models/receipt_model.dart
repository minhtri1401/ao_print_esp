import 'package:demo/domain/entities/receipt_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class ReceiptModel extends ReceiptEntity {
  ReceiptModel({
    required int qty,
    required String item,
    required double price,
  }) : super(qty: qty, item: item, price: price);

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReceiptModelToJson(this);
}


// ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) {
//   return ReceiptModel(
//     qty: json['qty'],
//     item: json['item'],
//     price: json['price'],
//   );
// }

// Map<String, dynamic> _$ReceiptModelToJson(ReceiptModel instance) {
//   return <String, dynamic>{
//     'qty': instance.qty,
//     'item': instance.item,
//     'price': instance.price,
//     'total': instance.total
//   };
// }