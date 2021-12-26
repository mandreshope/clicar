import 'package:equatable/equatable.dart';

class Purchase extends Equatable {
  final String? financing;

  const Purchase({
    this.financing,
  });

  @override
  List<Object?> get props => [financing];
}
