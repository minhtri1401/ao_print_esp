import 'package:demo/data/dataSource/receipt_data_source.dart';
import 'package:demo/domain/entities/receipt_entity.dart';

import '../../domain/repositories/receipt_repository.dart';

class ReceiptRepositoryImpl extends ReceiptRepository {
  final ReceiptsDataSource receiptsDataSource;
  ReceiptRepositoryImpl(this.receiptsDataSource);

  @override
  Future<List<ReceiptEntity>> getReceipts() async {
    // TODO: implement getReceipts
    final receipts = await receiptsDataSource.getReceipts();
    return receipts;
  }
}
