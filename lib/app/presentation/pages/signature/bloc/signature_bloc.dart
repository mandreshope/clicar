import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/contract/search_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:clicar/app/core/errors/message.dart';

part './signature_event.dart';
part './signature_state.dart';

class SignatureBloc extends Bloc<SignatureEvent, BaseState> {
  final SearchContractUseCase searchContractUseCase;
  final UploadSingleFileUseCase uploadSingleFileUseCase;
  final SignContractUseCase signContractUseCase;

  Contract contract = const Contract();
  UploadFile uploadFile = const UploadFile();

  SignatureBloc({
    required this.searchContractUseCase,
    required this.uploadSingleFileUseCase,
    required this.signContractUseCase,
  }) : super(const BaseState(status: Status.initial, message: "initial")) {
    on<SearchContractEvent>(_searchContractEvent,
        transformer: (Stream<SearchContractEvent> events, mapper) {
      return events.debounceTime(const Duration(seconds: 1)).switchMap(mapper);
    });
    on<SelectContractEvent>(_selectContractEvent);
    on<UploadSignatureFileEvent>(_uploadSignatureFileEvent);
    on<SignContractEvent>(_signContractEvent);
  }

  Future<void> _searchContractEvent(
      SearchContractEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final result = await searchContractUseCase(SearchContractParams(
        keyWord: event.keyWord,
        isSigned: false,
      ));
      result.fold(
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
          emit(SearchContractState(
              status: Status.success,
              message: 'search contract result',
              contracts: success));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future _selectContractEvent(SelectContractEvent event, Emitter emit) async {
    emit(const SelectedContractState(
      status: Status.success,
      message: "success",
      isAccepted: false,
      isSigned: false,
    ));
  }

  Future<void> _uploadSignatureFileEvent(
      UploadSignatureFileEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final upload = await uploadSingleFileUseCase(UploadSingleFileParams(
          file: event.file, fileDestination: "signatures"));
      upload.fold(
        (failure) {
          emit(SelectedContractState(
            status: Status.uploadFileFailed,
            message: "upload file failed",
            isAccepted: event.isAccepted,
            isSigned: false,
          ));
        },
        (success) async {
          uploadFile = success;
          emit(SelectedContractState(
            status: Status.uploadFileSuccess,
            message: "upload file success",
            isAccepted: event.isAccepted,
            isSigned: false,
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _signContractEvent(SignContractEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      //https://api-new.clicar.fr/uploadFile/file/signatures/41-418338_success1640557427707.png
      /*final urlPhoto =
              "${RemoteConfig.baseUrl}/uploadFile/file/signatures/${success.filename}";*/
      /// add baseUrl to display this path
      final urlPhoto = "$signatureServerFilePath${uploadFile.filename}";
      final payload = SignContractParams(
        numberContrat: event.contract.numberContrat!,
        signature: Signature(
          signature: urlPhoto,
          signatureDate: DateTime.now().formatDatePayload,
          isAccepted: event.isAccepted,
        ),
      );
      final sign = await signContractUseCase(payload);
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
          emit(SelectedContractState(
            status: Status.signed,
            message: "uploadFileSuccess",
            isAccepted: event.isAccepted,
            isSigned: true,
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }
}
