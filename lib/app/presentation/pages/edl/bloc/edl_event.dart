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

class AddFileOfCameraInteriorPosEvent extends EdlEvent {
  final File file;
  const AddFileOfCameraInteriorPosEvent({
    required this.file,
  });
  @override
  List<Object> get props => [file];
}

class SearchContractEvent extends EdlEvent {
  final String keyWord;

  const SearchContractEvent({required this.keyWord});

  @override
  List<Object> get props => [keyWord];
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

class UploadDefectsExteriorEvent extends EdlEvent {
  final List<File> files;

  const UploadDefectsExteriorEvent({
    required this.files,
  });

  @override
  List<Object> get props => [files];
}

class EdlPhotoDefectsEvent extends EdlEvent {
  @override
  List<Object> get props => [];
}

class EdlMileageEvent extends EdlEvent {
  @override
  List<Object> get props => [];
}

class EdlFuelLevelEvent extends EdlEvent {
  @override
  List<Object> get props => [];
}

class SignEdlEvent extends EdlEvent {
  final Contract contract;
  final bool isAccepted;
  final UploadFile uploadFile;

  const SignEdlEvent({
    required this.contract,
    required this.isAccepted,
    required this.uploadFile,
  });

  @override
  List<Object> get props => [contract, isAccepted, uploadFile];
}
