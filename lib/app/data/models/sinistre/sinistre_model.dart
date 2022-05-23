import 'package:clicar/app/data/models/sinistre/search_info_sinistre_model.dart';
import 'package:clicar/app/domain/entities/sinistre/sinistre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sinistre_model.g.dart';

@JsonSerializable(explicitToJson: true)

class SinistreModel extends Sinistre {
  final String? id;
  final String? numeroSinistre;
  final String? contrat;
  final String? returnDate;
  final String? commentClicar;

  final SearchInfoSinistreModel? search;

  final bool? deleted;
  final String? createdBy;
  final String? updatedBy;
  final String? deletedBy;

  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  final dynamic transform;
  const SinistreModel({
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
  }) : super(
    id: id,
    numeroSinistre: numeroSinistre,
    contrat: contrat,
    returnDate: returnDate,
    commentClicar: commentClicar,
    search: search,
    deleted: deleted,
    createdBy: createdBy,
    updatedBy: updatedBy,
    deletedBy: deletedBy,
    createdAt: createdAt,
    updatedAt: updatedAt,
    deletedAt: deletedAt,
    transform: transform
  );

  factory SinistreModel.fromJson(Map<String, dynamic> json) =>
      _$SinistreModelFromJson(json);

  Map<String, dynamic> toJson() => _$SinistreModelToJson(this);
  
}