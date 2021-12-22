import 'package:clicar/app/domain/entities/user/user.dart';
import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String token;
  final User user;

  const Register({required this.token, required this.user});

  @override
  List<Object> get props => [token, user];
}
