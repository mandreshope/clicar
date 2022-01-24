import 'dart:io';

import 'package:clicar/app/presentation/pages/document/types/document_item.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';

class DocumentPicker {
  File file;
  DocumentItem? type;
  DocumentItem? associated;
  String? associatedSelectedId;
  String? associatedSelectedName;
  ExpandableController expandableSearchController = ExpandableController();
  TextEditingController? search = TextEditingController();

  ExpandableController expandableTypeController = ExpandableController();
  ExpandableController expandableAssociateController = ExpandableController();

  DocumentPicker({
    required this.file,
    this.type,
    this.associated,
  });
}
