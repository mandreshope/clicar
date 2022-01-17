import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mileage_state.dart';

class MileageCubit extends Cubit<MileageState> {
  MileageCubit() : super(const MileageChangeState(value: 0));

  void change({
    required int kmInclus,
    required int departMileage,
    required int retourMileage,
  }) {
    if (departMileage < retourMileage) {
      final diff = (retourMileage - departMileage);
      if (kmInclus < diff) {
        final exceedValue = diff - kmInclus;
        emit(MileageChangeState(
            value: retourMileage, isExceed: true, exceedValue: exceedValue));
      } else {
        emit(MileageChangeState(value: retourMileage, isExceed: false));
      }
    } else {
      emit(MileageChangeState(value: retourMileage, isExceed: false));
    }
  }
}
