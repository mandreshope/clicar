import 'package:equatable/equatable.dart';

class Signature extends Equatable {
  final String? id;
  final String? signature;
  final bool? isAccepted;

  const Signature({
    this.id,
    this.signature,
    this.isAccepted,
  });

  @override
  List<Object?> get props => [id, signature, isAccepted];
}
