import 'package:equatable/equatable.dart';

class VehiclePourcentage extends Equatable {
  final String? label;
  final String? color;
  final dynamic value;
  const VehiclePourcentage({
    this.label,
    this.color,
    this.value,
  });
  @override
  List<Object?> get props => [
        label,
        color,
        value,
      ];
}
