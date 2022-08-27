import 'dart:convert';

import 'package:clean_architecture_app/src/core/error/exceptions.dart';
import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/models/quote_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class RandomQuoteLocalDataSource {
  Future<QuoteModel> getRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}

class RandomQuoteLocalDataSourceImplementation
    implements RandomQuoteLocalDataSource {
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImplementation({
    required this.sharedPreferences,
  });
  @override
  Future<void> cacheQuote(QuoteModel quote) {
    return sharedPreferences.setString(
      AppStrings.cachedRandomQuote,
      json.encode(quote),
    );
  }

  @override
  Future<QuoteModel> getRandomQuote() {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cachedRandomQuote = Future.value(
        QuoteModel.fromJson(
          json.decode(jsonString),
        ),
      );
      return cachedRandomQuote;
    } else {
      throw CacheException();
    }
  }
}
