import 'package:clean_architecture_app/src/core/error/failure.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepository {
  Future<Either<Failure, Quote>> getRandomQuote();
}
