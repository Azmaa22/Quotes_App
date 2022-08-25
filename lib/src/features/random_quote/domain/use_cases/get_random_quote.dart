import 'package:clean_architecture_app/src/core/error/failure.dart';
import 'package:clean_architecture_app/src/core/use_cases/use_case.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuote implements UseCase<Quote, NoParams> {
  final QuoteRepository quoteRepository;
  GetRandomQuote({required this.quoteRepository});
  @override
  Future<Either<Failure, Quote>> call(NoParams params) =>
      quoteRepository.getRandomQuote();
}
