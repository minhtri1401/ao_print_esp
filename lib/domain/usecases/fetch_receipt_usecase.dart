import 'package:demo/domain/repositories/receipt_repository.dart';

import '../entities/receipt_entity.dart';
import 'base_usecase.dart';

class FetchReceiptUseCase extends BaseUseCase<List<ReceiptEntity>, Object?> {
  final ReceiptRepository receiptRepository;
  FetchReceiptUseCase(this.receiptRepository);

  @override
  Future<List<ReceiptEntity>> perform({Object? param}) {
    return receiptRepository.getReceipts();
  }
}
