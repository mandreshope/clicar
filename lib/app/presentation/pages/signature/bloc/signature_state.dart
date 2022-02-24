part of 'signature_bloc.dart';

class SearchContractState extends BaseState {
  final List<Contract> contracts;

  const SearchContractState({
    required this.contracts,
    required Status status,
    required String message,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [contracts];
}

class SelectedContractState extends BaseState {
  final bool isAccepted;
  final bool isSigned;

  const SelectedContractState({
    required this.isAccepted,
    required Status status,
    required String message,
    required this.isSigned,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [isAccepted, isSigned];
}

class GetPdfContractSuccessState extends BaseState {
  final UploadFile? uploadFile;
  final bool isAccepted;
  final bool isSigned;

  const GetPdfContractSuccessState({
    required Status status,
    required String message,
    required this.uploadFile,
    required this.isSigned,
    required this.isAccepted,
  }) : super(status: status, message: message);

  @override
  List<Object?> get props => [
        uploadFile,
        isAccepted,
        isSigned,
      ];
}

class DownloadFileSuccessState extends BaseState {
  final File file;
  final bool isAccepted;
  final bool isSigned;

  const DownloadFileSuccessState({
    required Status status,
    required String message,
    required this.file,
    required this.isSigned,
    required this.isAccepted,
  }) : super(status: status, message: message);

  @override
  List<Object?> get props => [
        file,
        isAccepted,
        isSigned,
      ];
}
