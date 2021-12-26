import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String? id;
  final String? number;
  final String? name;
  final String? mail;
  final String? phone;

  const Search({
    this.id,
    this.number,
    this.name,
    this.mail,
    this.phone,
  });

  @override
  List<Object?> get props => [id, number, name, mail, phone];
}
