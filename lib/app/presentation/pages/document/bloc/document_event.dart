part of 'document_bloc.dart';

abstract class DocumentEvent extends Equatable {
  const DocumentEvent();
}

class AddDocumentPickerEvent extends DocumentEvent {
  final File file;

  const AddDocumentPickerEvent({
    required this.file,
  });

  @override
  List<Object> get props => [file];
}

class UpdateDocumentPickerEvent extends DocumentEvent {
  final File file;
  final int index;

  const UpdateDocumentPickerEvent({
    required this.file,
    required this.index,
  });

  @override
  List<Object> get props => [file, index];
}

class SelectTypeDocumentEvent extends DocumentEvent {
  final DocumentPicker documentPicker;
  final DocumentItem documentItem;

  const SelectTypeDocumentEvent({
    required this.documentPicker,
    required this.documentItem,
  });

  @override
  List<Object> get props => [documentPicker, documentItem];
}

class SelectAssociatedDocumentEvent extends DocumentEvent {
  final DocumentPicker documentPicker;
  final DocumentItem documentItem;

  const SelectAssociatedDocumentEvent({
    required this.documentPicker,
    required this.documentItem,
  });

  @override
  List<Object> get props => [documentPicker, documentItem];
}

class SelectAssociatedIdDocumentEvent extends DocumentEvent {
  final DocumentPicker documentPicker;
  final DocumentItem documentItem;
  final List<DocumentItem> result;

  const SelectAssociatedIdDocumentEvent({
    required this.documentPicker,
    required this.documentItem,
    required this.result,
  });

  @override
  List<Object> get props => [documentPicker, documentItem, result];
}

class UploadDocumentsEvent extends DocumentEvent {
  @override
  List<Object> get props => [];
}

class AssociateDocumentsEvent extends DocumentEvent {
  @override
  List<Object> get props => [];
}

class SearchAssociateEvent extends DocumentEvent {
  final String keyWord;
  final DocumentAssociate documentAssociate;

  const SearchAssociateEvent(
      {required this.keyWord, required this.documentAssociate});

  @override
  List<Object> get props => [keyWord];
}
