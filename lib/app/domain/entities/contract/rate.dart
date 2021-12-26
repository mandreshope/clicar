import 'package:clicar/app/domain/entities/contract/rate_info.dart';
import 'package:clicar/app/domain/entities/contract/remise.dart';
import 'package:clicar/app/domain/entities/contract/rent.dart';
import 'package:clicar/app/domain/entities/contract/warranty.dart';
import 'package:equatable/equatable.dart';

class Rate extends Equatable {
  final String? id;
  final List<Rent>? rent;
  final List<dynamic>? rentMajore;
  final List<dynamic>? optionNonRestitution;
  final List<dynamic>? options;
  final List<Warranty>? warranty;
  final List<dynamic>? retourAnticipe;
  final List<Remise>? remise;
  final RateInfo? info;

  const Rate({
    this.id,
    this.rent,
    this.rentMajore,
    this.optionNonRestitution,
    this.options,
    this.warranty,
    this.retourAnticipe,
    this.remise,
    this.info,
  });

  @override
  List<Object?> get props => [
        id,
        rent,
        rentMajore,
        optionNonRestitution,
        options,
        warranty,
        retourAnticipe,
        remise,
        info,
      ];
}
