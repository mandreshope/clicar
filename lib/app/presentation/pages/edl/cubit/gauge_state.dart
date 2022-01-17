part of 'gauge_cubit.dart';

abstract class GaugeState extends Equatable {
  const GaugeState();
}

class GaugeInitial extends GaugeState {
  final int value;
  const GaugeInitial({required this.value});
  @override
  List<Object> get props => [value];
}

class GaugeChangeState extends GaugeState {
  final int value;

  const GaugeChangeState({required this.value});

  @override
  List<Object> get props => [value];
}
