import 'package:equatable/equatable.dart';

class ForgotPassword extends Equatable {
  final String? status;
  final String? message;

  const ForgotPassword({
    this.status,
    this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
