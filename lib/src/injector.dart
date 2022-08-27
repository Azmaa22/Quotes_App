import 'package:clean_architecture_app/src/core/network/network_info.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/repositories/quote_repo_implementation.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<RandomQuoteCubit>(
      () => RandomQuoteCubit(getRandomQuoteUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<GetRandomQuote>(
      () => GetRandomQuote(quoteRepository: sl()));

  // Repository
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRepositoryImplementation(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(
      () => RandomQuoteLocalDataSourceImplementation(sharedPreferences: sl()));
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(
      () => RandomQuoteRemoteDataSourceImplementation(client: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(internetConnectionChecker: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
