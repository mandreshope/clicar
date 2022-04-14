import 'package:equatable/equatable.dart';

class Options extends Equatable {
  final String? gearBox;
  final String? color;
  final dynamic options;
  final List<dynamic>? equipments;
  final String? category;
  final int? motor;
  final double? additionalKmUnitPrice;

  const Options({
    this.gearBox,
    this.color,
    this.options,
    this.equipments,
    this.category,
    this.motor,
    this.additionalKmUnitPrice,
  });

  @override
  List<Object?> get props => [
        gearBox,
        color,
        options,
        equipments,
        category,
        motor,
        additionalKmUnitPrice,
      ];
}
