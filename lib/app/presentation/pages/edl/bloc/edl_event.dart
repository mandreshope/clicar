part of 'edl_bloc.dart';

abstract class EdlEvent extends Equatable {
  const EdlEvent();
}

class SelectCameraPosEvent extends EdlEvent {
  final CameraPos cameraPos;

  const SelectCameraPosEvent({
    required this.cameraPos,
  });

  @override
  List<Object> get props => [cameraPos];
}

class SelectCameraInteriorPosEvent extends EdlEvent {
  final CameraPos cameraPos;

  const SelectCameraInteriorPosEvent({
    required this.cameraPos,
  });

  @override
  List<Object> get props => [cameraPos];
}

class AddFileOfCameraPosEvent extends EdlEvent {
  final File file;

  const AddFileOfCameraPosEvent({
    required this.file,
  });

  @override
  List<Object> get props => [file];
}

class ReloadEvent extends EdlEvent {
  @override
  List<Object> get props => [];
}

class UpdateFileOfCameraPosEvent extends EdlEvent {
  final File file;
  final int index;

  const UpdateFileOfCameraPosEvent({
    required this.file,
    required this.index,
  });

  @override
  List<Object> get props => [file, index];
}

class AddFileOfCameraInteriorPosEvent extends EdlEvent {
  final File file;

  const AddFileOfCameraInteriorPosEvent({
    required this.file,
  });

  @override
  List<Object> get props => [file];
}

class UpdateFileOfCameraInteriorPosEvent extends EdlEvent {
  final int index;
  final File file;

  const UpdateFileOfCameraInteriorPosEvent({
    required this.index,
    required this.file,
  });

  @override
  List<Object> get props => [file, index];
}

class SearchContractEvent extends EdlEvent {
  final String keyWord;
  final TypeEdl? typeEdl;
  const SearchContractEvent({
    required this.keyWord,
    this.typeEdl,
  });

  @override
  List<Object?> get props => [keyWord, typeEdl];
}

class SearchBilledInfoEvent extends EdlEvent {
  final String keyWord;

  const SearchBilledInfoEvent({required this.keyWord});

  @override
  List<Object> get props => [keyWord];
}

class SelectBilledInfoEvent extends EdlEvent {
  final BilledInfo billedInfo;
  final List<BilledInfo> result;

  const SelectBilledInfoEvent({
    required this.billedInfo,
    required this.result,
  });

  @override
  List<Object> get props => [
        billedInfo,
        result,
      ];
}

class SelectContractEvent extends EdlEvent {
  final Contract contract;

  const SelectContractEvent({
    required this.contract,
  });

  @override
  List<Object> get props => [contract];
}

class UploadMultiFileEvent extends EdlEvent {
  final Contract contract;
  final List<File> files;
  final bool isAccepted;

  const UploadMultiFileEvent({
    required this.contract,
    required this.files,
    required this.isAccepted,
  });

  @override
  List<Object> get props => [contract, files, isAccepted];
}

class UploadPhotosExteriorEvent extends EdlEvent {
  final List<File> files;

  const UploadPhotosExteriorEvent({
    required this.files,
  });

  @override
  List<Object> get props => [files];
}

class EdlPhotosEvent extends EdlEvent {
  @override
  List<Object> get props => [];
}

class UploadPhotosInteriorEvent extends EdlEvent {
  final List<File> files;

  const UploadPhotosInteriorEvent({
    required this.files,
  });

  @override
  List<Object> get props => [files];
}

class UploadPhotoDefectsExteriorEvent extends EdlEvent {
  final File file;

  const UploadPhotoDefectsExteriorEvent({
    required this.file,
  });

  @override
  List<Object> get props => [file];
}

class EdlPhotoDefectsEvent extends EdlEvent {
  @override
  List<Object> get props => [];
}

class EdlDepartureNoteEvent extends EdlEvent {
  final String note;

  const EdlDepartureNoteEvent({required this.note});

  @override
  List<Object> get props => [note];
}

class EdlRetourNoteEvent extends EdlEvent {
  final String note;

  const EdlRetourNoteEvent({required this.note});

  @override
  List<Object> get props => [note];
}

class EdlMileageEvent extends EdlEvent {
  final int mileage;

  const EdlMileageEvent({required this.mileage});

  @override
  List<Object> get props => [mileage];
}

class EdlBilledInfoEvent extends EdlEvent {
  const EdlBilledInfoEvent();

  @override
  List<Object> get props => [];
}

class EdlFuelLevelEvent extends EdlEvent {
  final int fuel;

  const EdlFuelLevelEvent({required this.fuel});

  @override
  List<Object> get props => [fuel];
}

class EdlDepartureSignEvent extends EdlEvent {
  final bool isAccepted;

  const EdlDepartureSignEvent({required this.isAccepted});

  @override
  List<Object> get props => [isAccepted];
}

class EdlRetourSignEvent extends EdlEvent {
  final bool isAccepted;

  const EdlRetourSignEvent({required this.isAccepted});

  @override
  List<Object> get props => [isAccepted];
}

class UploadSignatureFileEvent extends EdlEvent {
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
