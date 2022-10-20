import 'package:demo/app/pages/receipt/bloc/receipt_bloc.dart';
import 'package:demo/data/dataSource/receipt_data_source.dart';
import 'package:demo/data/repositories/receipt_repository_impl.dart';
import 'package:demo/domain/repositories/receipt_repository.dart';
import 'package:demo/domain/usecases/fetch_receipt_usecase.dart';
import 'package:get_it/get_it.dart';

import 'app/services/navigation_service.dart';

GetIt locator = GetIt.instance;

Future setupLocator() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<ReceiptsDataSource>(
      () => ReceiptsDataSourceImpl());
  locator.registerLazySingleton<ReceiptRepository>(
      () => ReceiptRepositoryImpl(locator()));
  _setupViewModel();
  _setupUseCase();
}

void _setupViewModel() {
  locator.registerLazySingleton<ReceiptBloc>(() => ReceiptBloc(locator()));
}

void _setupUseCase() {
  locator.registerFactory(() => FetchReceiptUseCase(locator()));
}
