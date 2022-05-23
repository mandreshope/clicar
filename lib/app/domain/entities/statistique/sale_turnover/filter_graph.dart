import 'package:equatable/equatable.dart';

class FilterGraph extends Equatable {
  final List<int>? grapAmountToPay;
  final List<int>? grapAmount;
  final List<String>? mothSelected;

  const FilterGraph({
    this.grapAmountToPay,
    this.grapAmount,
    this.mothSelected,
  });
  @override
  List<Object?> get props => [
        grapAmountToPay,
        grapAmount,
        mothSelected,
      ];
}
