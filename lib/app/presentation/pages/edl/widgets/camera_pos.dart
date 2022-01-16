import 'dart:io';
import 'package:flutter/material.dart';

class CameraPos {
  final String? label;
  final double? rotation;
  bool isActive;
  bool hasPhoto;
  final Alignment? alignment;
  File? file;

  CameraPos({
    this.label,
    this.rotation,
    required this.isActive,
    this.alignment,
    this.file,
    this.hasPhoto = false,
  });

  @override
  String toString() {
    return 'CameraPos{label: $label, isActive: $isActive, hasPhoto: $hasPhoto, file: $file}';
  }
}
