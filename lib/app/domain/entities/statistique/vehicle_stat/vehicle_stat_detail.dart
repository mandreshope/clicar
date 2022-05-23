import 'package:clicar/app/domain/entities/statistique/vehicle_stat/rent_%20average.dart';
import 'package:equatable/equatable.dart';

class VehicleStatDetail extends Equatable {
  final int? chiffreAffaire;
  final String? pourentage;
  final RentAverage? loyerMoyern;
  final int? jour;
  const VehicleStatDetail({
    this.loyerMoyern,
    this.chiffreAffaire,
    this.pourentage,
    this.jour,

  });
  @override
  List<Object?> get props => [
        chiffreAffaire,
        pourentage,
        jour,
      ];
}
