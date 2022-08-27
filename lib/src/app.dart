import 'package:clean_architecture_app/src/config/routes/app_routes.dart';
import 'package:clean_architecture_app/src/config/routes/route_generator.dart';
import 'package:clean_architecture_app/src/config/themes/app_theme.dart';
import 'package:clean_architecture_app/src/core/network/network_info.dart';
import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/repositories/quote_repo_implementation.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/cubit/random_quote_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class QuoteApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  const QuoteApp({required this.sharedPreferences, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      return value;
    });
    return BlocProvider(
      create: (context) => RandomQuoteCubit(
        getRandomQuoteUseCase: GetRandomQuote(
          quoteRepository: QuoteRepositoryImplementation(
            networkInfo: NetworkInfoImplementation(
              internetConnectionChecker: InternetConnectionChecker(),
            ),
            randomQuoteLocalDataSource:
                RandomQuoteLocalDataSourceImplementation(
              sharedPreferences: sharedPreferences,
            ),
            randomQuoteRemoteDataSource:
                RandomQuoteRemoteDataSourceImplementation(
              client: http.Client(),
            ),
          ),
        ),
      )..getRandomQuote(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: appTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}
