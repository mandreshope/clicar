
import 'package:clicar/app/domain/entities/sinistre/search_info_sinistre.dart';
import 'package:equatable/equatable.dart';

class Sinistre extends Equatable {
  final String? id;
  final String? numeroSinistre;
  final String? contrat;
  final String? returnDate;
  final String? commentClicar;

  final SearchInfoSinistre? search;

  final bool? deleted;
  final String? createdBy;
  final String? updatedBy;
  final String? deletedBy;

  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  final dynamic transform;
  const Sinistre({
    this.id,
    this.numeroSinistre,
    this.contrat,
    this.returnDate,
    this.commentClicar,
    this.search,
    this.deleted,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.transform
  });

  @override 
  List<Object?> get props => [
    id,
    numeroSinistre,
    contrat,
    returnDate,
    commentClicar,
    search,
    deleted,
    createdBy,
    updatedBy,
    deletedBy,
    createdAt,
    updatedAt,
    deletedAt,
    transform
  ];
}