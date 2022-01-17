import 'package:bloc/bloc.dart';
import 'package:clicar/app/presentation/pages/edl/bloc/edl_bloc.dart';
import 'package:clicar/di/injection_container.dart';
import 'package:equatable/equatable.dart';

part './gauge_state.dart';

class GaugeCubit extends Cubit<GaugeState> {
  final GaugeInitial gaugeInitial;
  GaugeCubit({required this.gaugeInitial}) : super(gaugeInitial) {
    emit(GaugeChangeState(value: gaugeInitial.value));
  }

  void change(int value) {
    emit(GaugeChangeState(value: value));
  }
}
