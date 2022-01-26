import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/errors/message.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/domain/usecases/user/user_add_photo_usecase.dart';
import 'package:clicar/app/domain/usecases/user/user_change_password.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, BaseState> {
  final UploadSingleFileUseCase uploadSingleFileUseCase;
  final UserAddPhotoUseCase userAddPhotoUseCase;
  final UserChangePasswordUseCase userChangePasswordUseCase;
  UploadFile? uploadFile;

  AccountBloc({
    required this.uploadSingleFileUseCase,
    required this.userAddPhotoUseCase,
    required this.userChangePasswordUseCase,
  }) : super(const BaseState(status: Status.initial, message: 'initial')) {
    on<UploadUserPhotoFileEvent>(_uploadUserPhotoFileEvent);
    on<UserAddPhotoEvent>(_userAddPhotoEvent);
    on<UserChangePasswordEvent>(_userChangePasswordEvent);
  }

  Future<void> _uploadUserPhotoFileEvent(
      UploadUserPhotoFileEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final upload = await uploadSingleFileUseCase(UploadSingleFileParams(
          file: event.file, fileDestination: "profiles"));
      upload.fold(
        (failure) {
          emit(const BaseState(
            status: Status.uploadFileFailed,
            message: "upload file failed",
          ));
        },
        (success) async {
          uploadFile = success;
          emit(const BaseState(
            status: Status.uploadFileSuccess,
            message: "upload file success",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _userAddPhotoEvent(UserAddPhotoEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      //https://api-new.clicar.fr/uploadFile/file/profiles/avatar.png-undefined1640865516590.png
      /*final urlPhoto =
              "${RemoteConfig.baseUrl}/uploadFile/file/signatures/${success.filename}";*/
      /// add baseUrl to display this path
      final file = uploadFile;
      if (file == null) {
        return;
      }
      final urlPhoto = "$userPhotoServerFilePath${file.filename}";
      final sign = await userAddPhotoUseCase(
          UserAddPhotoParams(photo: urlPhoto, id: event.id));
      sign.fold(
        (failure) {
          if (failure is NoConnectionFailure) {
            emit(const ErrorState(
                status: Status.error, message: noConnexionMessage));
          } else if (failure is ServerFailure) {
            emit(const ErrorState(status: Status.error, message: serverError));
          } else if (failure is TokenExpiredFailure) {
            emit(const ErrorState(
                status: Status.tokenExpired, message: tokenExpired));
          } else {
            emit(const ErrorState(status: Status.error, message: unknownError));
          }
        },
        (success) {
          emit(const UserAddPhotoSuccessState(
              status: Status.success, message: 'success'));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _userChangePasswordEvent(
      UserChangePasswordEvent event, Emitter emit) async {
    emit(const UserChangePasswordLoadinState(
        status: Status.loading, message: 'loading ⌛'));
    try {
      final sign = await userChangePasswordUseCase(UserChangePasswordParams(
        password: event.password,
        id: event.id,
        newPassword: event.newPassword,
      ));
      sign.fold(
        (failure) {
          if (failure is NoConnectionFailure) {
            emit(const ErrorState(
                status: Status.error, message: noConnexionMessage));
          } else if (failure is ServerFailure) {
            if (failure.message.contains("Forbidden")) {
              emit(const ErrorState(
                  status: Status.error,
                  message: "Your old password is not correct"));
            } else {
              emit(
                  const ErrorState(status: Status.error, message: serverError));
            }
          } else if (failure is TokenExpiredFailure) {
            emit(const ErrorState(
                status: Status.tokenExpired, message: tokenExpired));
          } else {
            emit(const ErrorState(status: Status.error, message: unknownError));
          }
        },
        (success) {
          emit(const UserChangePasswordSuccessState(
              status: Status.success, message: 'success'));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }
}
