part of 'receipt_bloc.dart';

@immutable
abstract class ReceiptState {
  final List<ReceiptEntity> receipts;
  final int sample;

  const ReceiptState({
    this.sample = 0,
    this.receipts = const [],
  });
}

class ReceiptInitial extends ReceiptState {
  const ReceiptInitial({super.receipts, super.sample});
}
