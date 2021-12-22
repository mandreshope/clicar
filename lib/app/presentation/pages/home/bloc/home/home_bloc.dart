import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<OnInitHomeEvent>(_onInitHomeEvent);
  }

  Future<void> _onInitHomeEvent(OnInitHomeEvent event, Emitter emit) async {
    emit(HomeInitial());
  }
}
