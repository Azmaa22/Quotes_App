import 'package:clean_architecture_app/src/core/error/failure.dart';
import 'package:clean_architecture_app/src/core/use_cases/use_case.dart';
import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:clean_architecture_app/src/features/random_quote/presentation/cubit/random_quote_state.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:clean_architecture_app/src/features/random_quote/domain/use_cases/get_random_quote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  GetRandomQuote getRandomQuoteUseCase;
  RandomQuoteCubit({required this.getRandomQuoteUseCase})
      : super(RandomQuoteInitial());
  static RandomQuoteCubit get(context) => BlocProvider.of(context);
  Future<void> getRandomQuote() async {
    emit(
      RandomQuoteIsLoading(),
    );
    Either<Failure, Quote> response = await getRandomQuoteUseCase(NoParams());

    response.fold(
      (failure) => emit(
        RandomQuoteHaveError(
          errorMsg: _mapFailureToStringMsg(failure),
        ),
      ),
      (quote) => emit(
        RandomQuoteIsLoaded(quote: quote),
      ),
    );
  }

  String _mapFailureToStringMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case CacheFailure:
        return AppStrings.cacheFailure;

      default:
        return AppStrings.unexpectedFailure;
    }
  }
}
