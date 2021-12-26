import 'package:equatable/equatable.dart';

class Sale extends Equatable {
  final String? saleLabel;

  const Sale({
    this.saleLabel,
  });

  @override
  List<Object?> get props => [saleLabel];
}
