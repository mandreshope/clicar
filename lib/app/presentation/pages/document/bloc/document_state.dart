part of 'document_bloc.dart';

class UploadDocumentsSuccessState extends BaseState {
  const UploadDocumentsSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class AssociateDocumentsSuccessState extends BaseState {
  const AssociateDocumentsSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class SearchAssociateSuccessState extends BaseState {
  final List<DocumentItem> result;
  final String tag;

  const SearchAssociateSuccessState({
    required Status status,
    required String message,
    required this.result,
    this.tag = "",
  }) : super(
          status: status,
          message: message,
        );

  @override
  List<Object> get props => [result, tag];
}
