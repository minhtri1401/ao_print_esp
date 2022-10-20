import 'dart:convert';

import 'package:demo/app/pages/receipt/receipt_page.dart';
import 'package:demo/data/models/receipt_model.dart';
import 'package:demo/domain/entities/receipt_entity.dart';
import 'package:flutter/services.dart';

abstract class ReceiptsDataSource {
  Future<List<ReceiptEntity>> getReceipts();
}

class ReceiptsDataSourceImpl extends ReceiptsDataSource {
  final fileSource = 'assets/data/receipts.json';

  @override
  Future<List<ReceiptEntity>> getReceipts() async {
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString(fileSource);
    final decodeData = jsonDecode(json);
    return (decodeData as List).map((e) => ReceiptModel.fromJson(e)).toList();
  }
}
