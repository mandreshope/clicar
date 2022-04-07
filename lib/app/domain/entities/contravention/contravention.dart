import 'package:equatable/equatable.dart';

class Contravention extends Equatable {
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
  const Contravention({
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
  });
  @override
  List<Object?> get props => [
    id,
    state,
    date,
    path,
    filename,
    immat,
    vehicle,
    infractionDate,
    numberContract,
    client,
    type,
    noticeNumber,
    noticeDate,
    vpPrice,
    FDG,
    total,
    treatmentDate,
    agentPayement,
    status, 
    limitDate,
    createdBy,
    createdAt,
    contrats,
    transform,
    isMajore,
    document,
    dateDenoncer,
    dateDenonciation, 
    numDenoncer,
    search
  ];
}