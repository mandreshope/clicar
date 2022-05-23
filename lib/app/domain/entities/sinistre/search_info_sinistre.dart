import 'package:equatable/equatable.dart';

class SearchInfoSinistre extends Equatable {
  final String? numberContrat;
  final String? vehicleMark;
  final String? vehicleModel;
  final String? customerLastName;
  final String? customerFirstName;

  const SearchInfoSinistre({
    this.numberContrat,
    this.vehicleMark,
    this.vehicleModel,
    this.customerLastName,
    this.customerFirstName,
  });

  @override
  List<Object?> get props => [
    numberContrat, 
    vehicleMark, 
    vehicleModel, 
    customerLastName, 
    customerFirstName
  ];
}
