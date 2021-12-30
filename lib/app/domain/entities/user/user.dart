import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? role;
  final bool? deleted;
  final String? id;
  final String? lastName;
  final String? firstName;
  final String? username;
  final String? email;
  final String? password;
  final String? createdBy;
  final String? createdAt;
  final String? photo;

  const User({
    this.role,
    this.deleted,
    this.id,
    this.lastName,
    this.firstName,
    this.username,
    this.email,
    this.password,
    this.createdBy,
    this.createdAt,
    this.photo,
  });

  @override
  List<Object?> get props => [
        role,
        deleted,
        id,
        lastName,
        firstName,
        username,
        email,
        password,
        createdBy,
        createdAt,
        photo,
      ];
}
