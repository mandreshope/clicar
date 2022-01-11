import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edl_event.dart';
part 'edl_state.dart';

class EdlBloc extends Bloc<EdlEvent, EdlState> {
  EdlBloc() : super(EdlInitial()) {
    on<EdlEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
