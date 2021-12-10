import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {
  final String message;
  ServerFailure({required this.message});
  @override
  List<Object> get props => [message];

  @override
  bool? get stringify => true;
}

class CacheFailure extends Failure {}

class NoConnectionFailure extends Failure {}
