import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_pourcentage.dart';
import 'package:equatable/equatable.dart';

class RentData extends Equatable {
  final List<int>? nbr;
  final List<VehiclePourcentage>? poucentage;
  const RentData({
    this.nbr,
    this.poucentage,
  });
  @override
  List<Object?> get props => [
        nbr,
        poucentage,
      ];
}
