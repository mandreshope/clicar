part of 'mileage_cubit.dart';

abstract class MileageState extends Equatable {
  const MileageState();
}

class MileageChangeState extends MileageState {
  final int value;
  final bool isExceed;
  final int exceedValue;
  final double exceedPrice;
  const MileageChangeState({
    required this.value,
    this.isExceed = false,
    this.exceedValue = 0,
    this.exceedPrice = 0.0,
  });
  @override
  List<Object> get props => [value];
}
