part of 'signature_bloc.dart';

abstract class SignatureEvent extends Equatable {
  const SignatureEvent();
}

class SearchContractEvent extends SignatureEvent {
  final String keyWord;

  const SearchContractEvent({required this.keyWord});

  @override
  List<Object> get props => [keyWord];
}

class SelectContractEvent extends SignatureEvent {
  final Contract contract;

  const SelectContractEvent({
    required this.contract,
  });

  @override
  List<Object> get props => [contract];
}

class UploadSignatureFileEvent extends SignatureEvent {
  final Contract contract;
  final File file;
  final bool isAccepted;

  const UploadSignatureFileEvent({
    required this.contract,
    required this.file,
    required this.isAccepted,
  });

  @override
  List<Object> get props => [contract, file, isAccepted];
}

class SignContractEvent extends SignatureEvent {
  final Contract contract;
  final bool isAccepted;
  final UploadFile uploadFile;

  const SignContractEvent({
    required this.contract,
    required this.isAccepted,
    required this.uploadFile,
  });

  @override
  List<Object> get props => [contract, isAccepted, uploadFile];
}
