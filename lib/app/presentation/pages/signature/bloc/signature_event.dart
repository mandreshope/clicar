part of 'signature_bloc.dart';

abstract class SignatureEvent extends Equatable {
  const SignatureEvent();
}

class SearchContractEvent extends SignatureEvent {
  final String keyWord;
  final SignatureAssociate signatureAssociate;
  const SearchContractEvent({required this.keyWord, required this.signatureAssociate});

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

class SelectReservationEvent extends SignatureEvent {
  final Reservation reservation;

  const SelectReservationEvent({
    required this.reservation,
  });

  @override
  List<Object> get props => [reservation];
}

class SelectBdcEvent extends SignatureEvent {
  final Bdc bdc;

  const SelectBdcEvent({
    required this.bdc,
  });

  @override
  List<Object> get props => [bdc];
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
  final Bdc bdc;
  final UploadFile uploadFile;
  final Reservation reservation;
  const SignContractEvent({
    required this.bdc,
    required this.contract,
    required this.isAccepted,
    required this.uploadFile,
    required this.reservation
  });

  @override
  List<Object> get props => [bdc, contract, isAccepted, uploadFile, reservation];
}

class GetPdfContractEvent extends SignatureEvent {
  final Contract contract;

  const GetPdfContractEvent({
    required this.contract,
  });

  @override
  List<Object> get props => [
        contract,
      ];
}

class GetPdfReservationEvent extends SignatureEvent {
  final Reservation reservation;

  const GetPdfReservationEvent({
    required this.reservation,
  });

  @override
  List<Object> get props => [
        reservation,
      ];
}

class GetPdfBdcEvent extends SignatureEvent {
  final Bdc bdc;

  const GetPdfBdcEvent({
    required this.bdc,
  });

  @override
  List<Object> get props => [
        bdc,
      ];
}

class DownloadFileEvent extends SignatureEvent {
  final String path;
  final String fileName;

  const DownloadFileEvent({
    required this.path,
    required this.fileName,
  });

  @override
  List<Object> get props => [path, fileName];
}
