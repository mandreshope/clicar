import 'package:equatable/equatable.dart';

class ConditionAtEnd extends Equatable {
  final List<String>? conditions;
  final List<String>? faults;
  final String? id;
  final String? conditionDate;
  final String? comment;
  final int? km;
  final int? fuelQuantity;

  const ConditionAtEnd({
    this.conditions,
    this.faults,
    this.id,
    this.conditionDate,
    this.comment,
    this.km,
    this.fuelQuantity,
  });

  @override
  List<Object?> get props => [
        conditions,
        faults,
        id,
        conditionDate,
        comment,
        km,
        fuelQuantity,
      ];
}
