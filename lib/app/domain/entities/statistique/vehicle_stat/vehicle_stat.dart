import 'package:clicar/app/domain/entities/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';

class VehicleStat extends Equatable {
  final String? id;
  final List<Vehicle>? vehicles;
  const VehicleStat({
    this.id,
    this.vehicles,
  });
  @override
  List<Object?> get props => [
        id,
        vehicles,
      ];
}
