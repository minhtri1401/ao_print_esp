import 'package:bloc/bloc.dart';
import 'package:demo/domain/entities/receipt_entity.dart';
import 'package:demo/domain/usecases/fetch_receipt_usecase.dart';
import 'package:meta/meta.dart';

part 'receipt_event.dart';
part 'receipt_state.dart';

class ReceiptBloc extends Bloc<ReceiptEvent, ReceiptState> {
  final FetchReceiptUseCase fetchReceiptUseCase;

  ReceiptBloc(this.fetchReceiptUseCase)
      : super(const ReceiptInitial(receipts: [])) {
    on<AddReceiptEvent>((event, emit) {
      // TODO: implement event handler
      emit(ReceiptInitial(receipts: state.receipts + [event.receipt]));
    });
    on<InitialEvent>((event, emit) async {
      emit(ReceiptInitial(receipts: await fetchReceiptUseCase.perform()));
    });
  }
}
