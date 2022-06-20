

part of 'stat_bloc.dart';

class GetStatFlotteSuccessState extends BaseState {
  final GestionFlotteStat gestionFlotteStat;
  const GetStatFlotteSuccessState({
    required this.gestionFlotteStat,
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class GetStatEncaissementSuccessState extends BaseState {
  final EncaissementStat encaissementStat;
  const GetStatEncaissementSuccessState({
    required this.encaissementStat,
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}
