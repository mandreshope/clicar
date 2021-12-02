import 'package:intl/intl.dart';

extension FormatDate on DateTime {
  String get formatDateyMMMMd =>
      DateFormat.yMMMMd('fr_FR').format(toUtc().toLocal());

  /// 7/10/1996
  String get formatDateyMd => DateFormat.yMd('fr_FR').format(toUtc().toLocal());

  /// 06/11/2020 08:35
  String get formatDateyMdHm =>
      "${DateFormat.yMd('fr_FR').format(toUtc().toLocal())}"
      " ${DateFormat.Hm('fr_FR').format(toUtc().toLocal())}";

  /// 08:35
  String get formatDateHm =>
      "${DateFormat.Hm('fr_FR').format(toUtc().toLocal())}"
      " ${DateFormat.Hm('fr_FR').format(toUtc().toLocal())}";

  /// mai
  String get formatDateMMMM =>
      DateFormat.MMMM('fr_FR').format(toUtc().toLocal());

  /// SERVER FORMAT DATE
  ///
  /// 2020-11-20
  String get formatDatePayload => "$year-${twoDigits(month)}-${twoDigits(day)}";
  String twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}

Map<String, dynamic> removeNullsFromMap(Map<String, dynamic> json) => json
  ..removeWhere((String key, dynamic value) => value == null)
  ..map<String, dynamic>((key, value) => MapEntry(key, removeNulls(value)));

List removeNullsFromList(List<dynamic> list) => list
  ..removeWhere((value) => value == null)
  ..map((e) => removeNulls(e)).toList();

dynamic removeNulls(dynamic e) => (e is List)
    ? removeNullsFromList(e)
    : (e is Map<String, dynamic> ? removeNullsFromMap(e) : e);

extension ListExtension on List {
  List get removeNulls => removeNullsFromList(this);
}

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> get removeNulls => removeNullsFromMap(this);
}
