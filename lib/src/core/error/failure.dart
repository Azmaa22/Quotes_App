import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({message}) : super(message: message);

  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  const CacheFailure({message}) : super(message: message);

  @override
  List<Object> get props => [];
}

class OfflineFailure extends Failure {
  const OfflineFailure({message}) : super(message: message);

  @override
  List<Object> get props => [];
}
