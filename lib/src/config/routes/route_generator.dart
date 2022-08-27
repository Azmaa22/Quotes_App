import 'package:clean_architecture_app/src/config/routes/app_routes.dart';
import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:clean_architecture_app/src/features/favorite_quote/presentation/screens/favorite_quote_screen.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/screens/quote_screen.dart';
import 'package:clean_architecture_app/src/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRoutes.quoteScreen:
        return MaterialPageRoute(
          builder: (context) => const QuoteScreen(),
        );
      case AppRoutes.favoriteQuoteScreen:
        return MaterialPageRoute(
          builder: (context) => const FavoriteQuoteScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
