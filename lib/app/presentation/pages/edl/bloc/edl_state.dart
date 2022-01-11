part of 'edl_bloc.dart';

abstract class EdlState extends Equatable {
  const EdlState();
}

class EdlInitial extends EdlState {
  @override
  List<Object> get props => [];
}
