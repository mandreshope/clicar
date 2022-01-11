import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part './gauge_state.dart';

class GaugeCubit extends Cubit<GaugeState> {
  GaugeCubit() : super(GaugeInitial());

  void change(int value) {
    emit(GaugeChangeState(value: value));
  }
}
