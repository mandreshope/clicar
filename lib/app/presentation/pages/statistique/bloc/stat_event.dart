part of 'stat_bloc.dart';

abstract class StatEvent extends Equatable {

}

class GetStatFlotteEvent extends StatEvent {
  final Map<String, dynamic> data;
  GetStatFlotteEvent({required this.data});
  @override
  List<Object?> get props => [data];
  
}

class GetStatEncaissementEvent extends StatEvent {
  final Map<String, dynamic> data;
  GetStatEncaissementEvent({required this.data});
  @override
  List<Object?> get props => [data];
  
}

class GetListVehicleStatEvent extends StatEvent {
  @override
  List<Object?> get props => [];
}

class GetVehicleStatEvent extends StatEvent {
  final Map<String, dynamic> data;
  GetVehicleStatEvent({required this.data});
  @override
  List<Object?> get props => [data];
}