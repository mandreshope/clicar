import 'dart:math';

import 'package:clicar/app/core/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TestString on String {
  bool get isValidateEmail => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(this);
  bool get isValidateUrl => RegExp(
          r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)')
      .hasMatch(this);
  isValidatePassword() => length >= 4 ? true : false;

  bool isdouble() {
    try {
      double.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }
}

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

  /// SERVER FORMAT DATE
  ///
  /// 17-01-2022
  String get formatDatePayloadFr =>
      "${twoDigits(day)}-${twoDigits(month)}-$year";
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

extension SizerExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double h(BuildContext context) => this * Responsive.height(context) / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double w(BuildContext context) => this * Responsive.width(context) / 100;

  static Size resolution(BuildContext context) =>
      Size(Responsive.width(context), Responsive.height(context));

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double sp(BuildContext context) =>
      (this * scaleText(context)).roundToDouble();

  double scaleText(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));

  /// The ratio of actual width to UI design
  double scaleWidth(BuildContext context) =>
      (Responsive.width(context) / (Responsive.isMobile(context) ? 3.5 : 5)) /
      100;

  /// The ratio of actual height to UI design
  double scaleHeight(BuildContext context) =>
      (Responsive.height(context) / (Responsive.isMobile(context) ? 3.5 : 5)) /
      100;
}
