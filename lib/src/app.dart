import 'package:clean_architecture_app/src/config/routes/app_routes.dart';
import 'package:clean_architecture_app/src/config/routes/route_generator.dart';
import 'package:clean_architecture_app/src/config/themes/app_theme.dart';
import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: AppRoutes.quoteScreen,
    );
  }
}
