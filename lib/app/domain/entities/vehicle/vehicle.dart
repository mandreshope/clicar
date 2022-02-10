import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/vehicle/general.dart';
import 'package:clicar/app/domain/entities/vehicle/insurance.dart';
import 'package:clicar/app/domain/entities/vehicle/options.dart';
import 'package:clicar/app/domain/entities/vehicle/purchase.dart';
import 'package:clicar/app/domain/entities/vehicle/registration.dart';
import 'package:clicar/app/domain/entities/vehicle/sale.dart';
import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String? id;
  final List<dynamic>? immos;
  final List<dynamic>? maintenances;
  final List<dynamic>? pvs;
  final bool? deleted;
  final List<Contract?>? contrats;
  final List<dynamic>? locations;
  final String? number;
  final String? immat1;
  final String? immat2;
  final String? serialNumber;
  final String? mark;
  final String? modele;
  final String? state;
  final General? general;
  final Options? options;
  final Purchase? purchase;
  final Registration? registration;
  final Sale? sale;
  final Insurance? insurance;
  final dynamic documents; //TODO TYPE OF DOCUMENTS
  final String? createdBy;
  final String? createdAt;
  final int? v;

  const Vehicle({
    this.id,
    this.immos,
    this.maintenances,
    this.pvs,
    this.deleted,
    this.contrats,
    this.locations,
    this.number,
    this.immat1,
    this.immat2,
    this.serialNumber,
    this.mark,
    this.modele,
    this.state,
    this.general,
    this.options,
    this.purchase,
    this.registration,
    this.sale,
    this.insurance,
    this.documents,
    this.createdBy,
    this.createdAt,
    this.v,
  });

  @override
  List<Object?> get props => [
        id,
        immos,
        maintenances,
        pvs,
        deleted,
        contrats,
        locations,
        number,
        immat1,
        immat2,
        serialNumber,
        mark,
        modele,
        state,
        general,
        options,
        purchase,
        registration,
        sale,
        insurance,
        documents,
        createdBy,
        createdAt,
        v,
      ];
}
