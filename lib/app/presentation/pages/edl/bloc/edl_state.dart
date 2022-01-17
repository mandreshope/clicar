part of 'edl_bloc.dart';

class EdlInitial extends BaseState {
  const EdlInitial({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

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

class UploadPhotosExteriorSuccess extends BaseState {
  const UploadPhotosExteriorSuccess({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class UploadPhotosInteriorSuccess extends BaseState {
  const UploadPhotosInteriorSuccess({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class AddFileOfCameraPosState extends BaseState {
  const AddFileOfCameraPosState({
    required Status status,
    required String message,
  }) : super(status: status, message: message);
}

class SelectCameraPosState extends BaseState {
  final CameraPos cameraPos;

  const SelectCameraPosState({
    required this.cameraPos,
    required Status status,
    required String message,
  }) : super(status: status, message: message);

  @override
  List<Object> get props => [cameraPos];
}

class EdlPhotosSuccessState extends BaseState {
  const EdlPhotosSuccessState({required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class EdlPhotoDefectsSuccessState extends BaseState {
  const EdlPhotoDefectsSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class EdlMileageSuccessState extends BaseState {
  const EdlMileageSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class EdlDepartureNoteSuccessState extends BaseState {
  const EdlDepartureNoteSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class EdlFuelLevelSuccessState extends BaseState {
  const EdlFuelLevelSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class EdlRetourNoteSuccessState extends BaseState {
  const EdlRetourNoteSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}

class UploadPhotoDefectsExteriorSuccessState extends BaseState {
  const UploadPhotoDefectsExteriorSuccessState(
      {required Status status, required String message})
      : super(
          status: status,
          message: message,
        );
}
