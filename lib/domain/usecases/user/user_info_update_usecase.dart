import 'package:clicar/core/errors/failures.dart';
import 'package:clicar/core/usecases/usecase.dart';
import 'package:clicar/domain/entities/user/user.dart';
import 'package:clicar/domain/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class UserInfoUpdateUseCase implements UseCase<User, UserInfoUpdateParams> {
  final UserRepository repository;

  UserInfoUpdateUseCase({required this.repository});

  @override
  Future<Either<Failure, User>> call(UserInfoUpdateParams params) async {
    return await repository.userInfoUpdate(
      username: params.username,
      email: params.email,
      id: params.id,
      lastName: params.lastName,
      firstName: params.firstName,
      role: params.role,
      deleted: params.deleted,
    );
  }
}

class UserInfoUpdateParams extends Equatable {
  final String username;
  final String email;
  final String lastName;
  final String firstName;
  final String role;
  final bool deleted;
  final String id;

  const UserInfoUpdateParams({
    required this.username,
    required this.email,
    required this.lastName,
    required this.firstName,
    required this.role,
    required this.deleted,
    required this.id,
  });

  @override
  List<Object> get props => [
        username,
        email,
        lastName,
        firstName,
        role,
        deleted,
        id,
      ];
}
