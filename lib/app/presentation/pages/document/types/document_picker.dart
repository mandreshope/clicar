import 'dart:io';

import 'package:clicar/app/presentation/pages/document/types/document_item.dart';
import 'package:flutter/cupertino.dart';

class DocumentPicker {
  final File file;
  DocumentItem? type;
  DocumentItem? associated;
  String? associatedSelectedId;
  String? associatedSelectedName;
  TextEditingController? search = TextEditingController();

  DocumentPicker({
    required this.file,
    this.type,
    this.associated,
  });
}
