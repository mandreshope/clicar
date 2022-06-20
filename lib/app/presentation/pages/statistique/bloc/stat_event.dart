part of 'stat_bloc.dart';

abstract class StatEvent extends Equatable {

}

class GetStatFlotteEvent extends StatEvent {
  final Map<String, dynamic> data;
  GetStatFlotteEvent({required this.data});
  @override
  List<Object?> get props => [];
  
}

class GetStatEncaissementEvent extends StatEvent {
  final Map<String, dynamic> data;
  GetStatEncaissementEvent({required this.data});
  @override
  List<Object?> get props => [];
  
}