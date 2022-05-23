import 'package:equatable/equatable.dart';

class UserFact extends Equatable {
  final String? id;
  final String? role;
  final bool? deleted;
  final String? lastName;
  final String? firstName;
  final String? username;
  final String? email;
  final String? password;
  final String? createdBy;
  final String? categorie;
  final String? createdAt;
  final int? v;
  final int? createdContracts;

  const UserFact({
    this.id,
    this.deleted,
    this.role,
    this.lastName,
    this.firstName,
    this.username,
    this.email,
    this.password,
    this.createdBy,
    this.categorie,
    this.createdAt,
    this.v,
    this.createdContracts,
  });

  @override
  List<Object?> get props => [
        id,
        deleted,
        role,
        lastName,
        firstName,
        username,
        email,
        password,
        createdBy,
        categorie,
        createdAt,
        v,
        createdContracts,
      ];
}
