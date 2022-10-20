part of 'receipt_bloc.dart';

@immutable
abstract class ReceiptEvent {}

class AddReceiptEvent extends ReceiptEvent {
  final ReceiptEntity receipt;

  AddReceiptEvent(this.receipt);
}

class InitialEvent extends ReceiptEvent {}
