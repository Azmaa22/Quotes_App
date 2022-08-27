import 'package:clean_architecture_app/src/features/random_quote/domain/entities/quote.dart';
import 'package:equatable/equatable.dart';

abstract class RandomQuoteState extends Equatable {
  const RandomQuoteState();

  @override
  List<Object> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {}

class RandomQuoteIsLoading extends RandomQuoteState {}

class RandomQuoteIsLoaded extends RandomQuoteState {
  final Quote quote;

  const RandomQuoteIsLoaded({required this.quote});
  @override
  List<Object> get props => [
        quote,
      ];
}

class RandomQuoteHaveError extends RandomQuoteState {
  final String errorMsg;

  const RandomQuoteHaveError({required this.errorMsg});
  @override
  List<Object> get props => [
        errorMsg,
      ];
}
