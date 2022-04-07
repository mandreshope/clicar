import 'package:clicar/app/domain/entities/contravention/contravention.dart';
import 'package:json_annotation/json_annotation.dart';
part 'contravention_model.g.dart';

@JsonSerializable()
class ContraventionModel extends Contravention {
  final String? id;
  final String? state;
  final String? date; //Date
  final String? path;
  final String? filename;
  final String? immat;
  final dynamic vehicle;
  final String? infractionDate; //Date
  final String? numberContract;
  final dynamic client;
  final String? type;
  final String? noticeNumber;
  final String? noticeDate; // date
  final String? vpPrice;
  final String? FDG;
  final String? total;
  final String? treatmentDate; //date
  final String? agentPayement;
  final String? status;
  final String? limitDate; //date
  final dynamic  createdBy;
  final String? createdAt; //Date;
  final dynamic contrats;
  final dynamic transform;
  final bool? isMajore;
  final dynamic document;
  final String? dateDenoncer; //Date;
  final String? dateDenonciation; //Date;
  final String? numDenoncer;
  final dynamic search;
  const ContraventionModel({
    this.id,
    this.state,
    this.date,
    this.path,
    this.filename,
    this.immat,
    this.vehicle,
    this.infractionDate,
    this.numberContract,
    this.client,
    this.type,
    this.noticeNumber,
    this.noticeDate,
    this.vpPrice,
    this.FDG,
    this.total,
    this.treatmentDate,
    this.agentPayement,
    this.status, 
    this.limitDate,
    this.createdBy,
    this.createdAt,
    this.contrats,
    this.transform,
    this.isMajore,
    this.document,
    this.dateDenoncer,
    this.dateDenonciation, 
    this.numDenoncer,
    this.search
  }) : super(
    id: id,
    state: state,
    date: date,
    path: path,
    filename: filename,
    immat: immat,
    vehicle: vehicle,
    infractionDate: infractionDate,
    numberContract: numberContract,
    client: client,
    type: type,
    noticeNumber: noticeNumber,
    noticeDate: noticeDate,
    vpPrice: vpPrice,
    FDG: FDG,
    total: total,
    treatmentDate: treatmentDate,
    agentPayement: agentPayement,
    status: status, 
    limitDate: limitDate,
    createdBy: createdBy,
    createdAt: createdAt,
    contrats: contrats,
    transform: transform,
    isMajore: isMajore,
    document: document,
    dateDenoncer: dateDenoncer,
    dateDenonciation: dateDenonciation, 
    numDenoncer: numDenoncer,
    search: search
  );
  
  factory ContraventionModel.fromJson(Map<String, dynamic> json) =>
      _$ContraventionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContraventionModelToJson(this);
}