import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/domain/usecases/user/user_add_photo_usecase.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, BaseState> {
  final UploadSingleFileUseCase uploadSingleFileUseCase;
  final UserAddPhotoUseCase userAddPhotoUseCase;
  UploadFile? uploadFile;
  AccountBloc({
    required this.uploadSingleFileUseCase,
    required this.userAddPhotoUseCase,
  }) : super(const BaseState(status: Status.initial, message: 'initial')) {
    on<UploadUserPhotoFileEvent>(_uploadUserPhotoFileEvent);
    on<UserAddPhotoEvent>(_userAddPhotoEvent);
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
      emit(ErrorState(status: Status.error, message: _.toString()));
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
                status: Status.error, message: 'No connextion error'));
          } else if (failure is ServerFailure) {
            emit(ErrorState(status: Status.error, message: failure.message));
          } else if (failure is TokenExpiredFailure) {
            emit(const ErrorState(
                status: Status.tokenExpired,
                message: 'token expired 🔑🔑🔑🔑🔑🪙🪙🔑🔑🔑'));
          } else {
            emit(const ErrorState(
                status: Status.error, message: 'Unknown error'));
          }
        },
        (success) {
          emit(const UserAddPhotoSuccessState(
              status: Status.success, message: 'success'));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }
}
