import 'package:equatable/equatable.dart';

class General extends Equatable {
  final String? cases;
  final String? datelastKm;
  final String? keyDouble;
  final dynamic lastKm;
  final String? geoloc;
  final String? lastControlDate;
  final String? entryDate;
  final String? fuelType;
  final double? fuelGauge;
  final String? gaugeDate;
  final String? category;

  const General({
    this.cases,
    this.datelastKm,
    this.keyDouble,
    this.lastKm,
    this.geoloc,
    this.lastControlDate,
    this.entryDate,
    this.fuelType,
    this.fuelGauge,
    this.gaugeDate,
    this.category,
  });

  @override
  List<Object?> get props => [
        cases,
        datelastKm,
        keyDouble,
        lastKm,
        geoloc,
        lastControlDate,
        entryDate,
        fuelType,
        fuelGauge,
        gaugeDate,
        category,
      ];
}
