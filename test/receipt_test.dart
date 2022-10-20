// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:demo/app/pages/receipt/bloc/receipt_bloc.dart';
import 'package:demo/data/dataSource/receipt_data_source.dart';
import 'package:demo/data/repositories/receipt_repository_impl.dart';
import 'package:demo/domain/entities/receipt_entity.dart';
import 'package:demo/domain/usecases/fetch_receipt_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:demo/main.dart';

void main() {
  testWidgets('Receipt increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.

    // Verify that our counter starts at 0.

    // Tap the '+' icon and trigger a frame.

    // Verify that our counter has incremented.
  });

  blocTest(
    'emits some [Receipts] when AddReceiptEvent is added',
    build: () {
      final receiptsDataSource = ReceiptsDataSourceImpl();
      final receiptRepository = ReceiptRepositoryImpl(receiptsDataSource);
      final FetchReceiptUseCase fetchReceiptUseCase =
          FetchReceiptUseCase(receiptRepository);
      return ReceiptBloc(fetchReceiptUseCase);
    },
    act: (bloc) =>
        bloc.add(AddReceiptEvent(ReceiptEntity(qty: 2, price: 0.99))),
    expect: () => [isA<ReceiptState>()],
    verify: (bloc) {
      final item = bloc.state.receipts.first;
      assert(bloc.state.receipts.length == 1, true);
      assert(item.total == item.price * item.qty);
    },
  );
}
