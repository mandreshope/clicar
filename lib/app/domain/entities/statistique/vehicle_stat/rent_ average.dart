import 'package:clicar/app/domain/entities/statistique/vehicle_stat/rent_data.dart';
import 'package:equatable/equatable.dart';

class RentAverage extends Equatable {
  final RentData? mensuel;
  final RentData? hebdomadaire;
  const RentAverage({
    this.mensuel,
    this.hebdomadaire,
  });
  @override
  List<Object?> get props => [
        mensuel,
        hebdomadaire,
      ];
}
