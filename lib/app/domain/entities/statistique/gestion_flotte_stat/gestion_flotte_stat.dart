import 'package:equatable/equatable.dart';

class GestionFlotteStat extends Equatable {
  final int? nbLoue;
  final int? nbRendu;
  final int? vehiclDispo;
  final int? nbvehicleBooking;
  final int? totalVehicl;
  final int? nbPourcDispo;
  final int? nbPourcLoue;
  final String? pourcentageLoue;
  final String? inDispo;
  final String? pourcentageRendu;
  final String? pourcentageBooking;

  const GestionFlotteStat({
    this.nbLoue,
    this.nbRendu,
    this.vehiclDispo,
    this.nbvehicleBooking,
    this.totalVehicl,
    this.nbPourcDispo,
    this.nbPourcLoue,
    this.pourcentageLoue,
    this.inDispo,
    this.pourcentageRendu,
    this.pourcentageBooking,
  });

  @override
  List<Object?> get props => [
        nbLoue,
        nbRendu,
        vehiclDispo,
        nbvehicleBooking,
        totalVehicl,
        nbPourcDispo,
        nbPourcLoue,
        pourcentageLoue,
        inDispo,
        pourcentageRendu,
        pourcentageBooking,
      ];
}
