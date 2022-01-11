part of 'gauge_cubit.dart';

abstract class GaugeState extends Equatable {
  const GaugeState();
}

class GaugeInitial extends GaugeState {
  @override
  List<Object> get props => [];
}

class GaugeChangeState extends GaugeState {
  final int value;

  const GaugeChangeState({required this.value});

  @override
  List<Object> get props => [value];
}
