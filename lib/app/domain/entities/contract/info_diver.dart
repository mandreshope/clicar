import 'package:equatable/equatable.dart';

class InfoDiver extends Equatable {
  final String? locationType;
  final String? contractTypeDetails;
  final String? aValider;
  final String? contratInfo;
  final dynamic contrat;

  const InfoDiver({
    this.locationType,
    this.contractTypeDetails,
    this.aValider,
    this.contratInfo,
    this.contrat,
  });

  @override
  List<Object?> get props => [
        locationType,
        contractTypeDetails,
        aValider,
        contratInfo,
        contrat,
      ];
}
