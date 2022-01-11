part of 'draggable_cubit.dart';

abstract class DraggableState extends Equatable {
  const DraggableState();
}

class DraggableInitial extends DraggableState {
  @override
  List<Object> get props => [];
}

class DragsState extends DraggableState {
  const DragsState();
  @override
  List<Object> get props => [];
}
