import 'package:clean_architecture_app/src/core/error/exceptions.dart';
import 'package:clean_architecture_app/src/core/network/network_info.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/data_sources/random_quote_local_data_source.dart';
import 'package:clean_architecture_app/src/features/random_quote/data/data_sources/random_quote_remote_data_source.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:clean_architecture_app/src/core/error/failure.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/repositories/quote_repo.dart';
import 'package:dartz/dartz.dart';

class QuoteRepositoryImplementation implements QuoteRepository {
  final NetworkInfo networkInfo;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource;
  QuoteRepositoryImplementation({
    required this.networkInfo,
    required this.randomQuoteLocalDataSource,
    required this.randomQuoteRemoteDataSource,
  });

  @override
  Future<Either<Failure, Quote>> getRandomQuote() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRandomQuote =
            await randomQuoteRemoteDataSource.getRandomQuote();
        randomQuoteLocalDataSource.cacheQuote(remoteRandomQuote);
        return Right(Quote(
          author: remoteRandomQuote.author,
          id: remoteRandomQuote.id,
          quoteContent: remoteRandomQuote.quote,
          permaLink: remoteRandomQuote.permalink,
        ));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cacheRandomQuote =
            await randomQuoteLocalDataSource.getRandomQuote();

        return Right(Quote(
          author: cacheRandomQuote.author,
          id: cacheRandomQuote.id,
          quoteContent: cacheRandomQuote.quote,
          permaLink: cacheRandomQuote.permalink,
        ));
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
