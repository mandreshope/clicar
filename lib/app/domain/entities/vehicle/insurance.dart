import 'package:equatable/equatable.dart';

class Insurance extends Equatable {
  final String? handledByClient;
  final dynamic insurer;
  final dynamic optionalInsurance;
  final String? type;

  const Insurance({
    this.handledByClient,
    this.insurer,
    this.optionalInsurance,
    this.type,
  });

  @override
  List<Object?> get props => [
        handledByClient,
        insurer,
        optionalInsurance,
        type,
      ];
}
