import 'package:equatable/equatable.dart';

class Remise extends Equatable {
  final List<String>? echeanceToApplicate;
  final String? id_;
  final int? id;
  final String? commercial;
  final String? motif;
  final String? amount;
  final String? remiseBegin;
  final String? remiseEnd;
  final String? aValider;

  const Remise({
    this.echeanceToApplicate,
    this.id_,
    this.id,
    this.commercial,
    this.motif,
    this.amount,
    this.remiseBegin,
    this.remiseEnd,
    this.aValider,
  });

  @override
  List<Object?> get props => [
        echeanceToApplicate,
        id_,
        id,
        commercial,
        motif,
        amount,
        remiseBegin,
        remiseEnd,
        aValider,
      ];
}
