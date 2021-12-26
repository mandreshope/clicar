import 'package:equatable/equatable.dart';

class HistoryReglement extends Equatable {
  final String? text;
  final String? date;

  const HistoryReglement({
    this.text,
    this.date,
  });

  @override
  List<Object?> get props => [text, date];
}
