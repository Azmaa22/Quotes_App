import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:clean_architecture_app/src/core/api/end_points.dart';
import 'package:clean_architecture_app/src/core/error/exceptions.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote();
}

class RandomQuoteRemoteDataSourceImplementation
    implements RandomQuoteRemoteDataSource {
  http.Client client;
  RandomQuoteRemoteDataSourceImplementation({required this.client});
  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await client.get(
        Uri.parse('http://quotes.stormconsultancy.co.uk/random.json'),
        headers: {
          'content-type': 'application/json',
        });
    if (response.statusCode == 200) {
      return QuoteModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw const ServerException();
    }
  }
}
