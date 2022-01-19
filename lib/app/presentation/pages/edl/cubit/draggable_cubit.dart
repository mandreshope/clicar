import 'package:bloc/bloc.dart';
import 'package:clicar/app/presentation/pages/edl/types/drag.dart';
import 'package:equatable/equatable.dart';

part './draggable_state.dart';

class DraggableCubit extends Cubit<DraggableState> {
  List<Drag> drags = [];

  DraggableCubit() : super(DraggableInitial());

  void addDrags(Drag drag) {
    drags.add(drag);
  }

  void removeDrags(Drag drag) {
    drags.remove(drag);
  }
}
