import 'package:demo/domain/entities/receipt_entity.dart';

abstract class ReceiptRepository {
  Future<List<ReceiptEntity>> getReceipts();
}
