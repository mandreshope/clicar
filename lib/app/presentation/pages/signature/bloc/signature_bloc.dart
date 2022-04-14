import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/domain/entities/bdc/bdc.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/bdc/get_pdf_bdc_usecase.dart';
import 'package:clicar/app/domain/usecases/bdc/search_bdc_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/download_file_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/get_pdf_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/search_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/contract/sign_contract_usecase.dart';
import 'package:clicar/app/domain/usecases/reservation/get_pdf_reservation_usecase.dart';
import 'package:clicar/app/domain/usecases/reservation/search_reservation_usecase.dart';
import 'package:clicar/app/domain/usecases/reservation/sign_reservation_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/presentation/pages/signature/enums/signature_associate.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:clicar/app/core/errors/message.dart';

part './signature_event.dart';
part './signature_state.dart';

class SignatureBloc extends Bloc<SignatureEvent, BaseState> {
  final SearchContractUseCase searchContractUseCase;
  final UploadSingleFileUseCase uploadSingleFileUseCase;
  final SignContractUseCase signContractUseCase;
  final GetPdfContractUsecase getPdfContractUsecase;
  final DownloadFileUsecase downloadFileUsecase;
  final SearchReservationUseCase searchReservationUseCase;
  final GetPdfReservationUsecase getPdfReservationUsecase;
  final SearchBdcUseCase searchBdcUseCase;
  final GetPdfBdcUsecase getPdfBdcUsecase;
  final SignReservationUseCase signReservationUseCase;
  Contract contract = const Contract();
  UploadFile uploadFile = const UploadFile();
  Reservation reservation = const Reservation();
  Bdc bdc = const Bdc();

  SignatureAssociate? signatureAssociate;
  SignatureBloc({
    required this.searchContractUseCase,
    required this.uploadSingleFileUseCase,
    required this.signContractUseCase,
    required this.getPdfContractUsecase,
    required this.downloadFileUsecase,
    required this.searchReservationUseCase,
    required this.getPdfReservationUsecase,
    required this.searchBdcUseCase,
    required this.getPdfBdcUsecase,
    required this.signReservationUseCase,
  }) : super(const BaseState(status: Status.initial, message: "initial")) {
    on<SearchContractEvent>(_searchContractEvent,
        transformer: (Stream<SearchContractEvent> events, mapper) {
      return events.debounceTime(const Duration(seconds: 1)).switchMap(mapper);
    });
    on<SelectContractEvent>(_selectContractEvent);
    on<UploadSignatureFileEvent>(_uploadSignatureFileEvent);
    on<SignContractEvent>(_signContractEvent);
    on<GetPdfContractEvent>(_getPdfContractEvent);
    on<DownloadFileEvent>(_downloadFileEvent);
    on<GetPdfReservationEvent>(_getPdfReservationEvent);
    on<GetPdfBdcEvent>(_getPdfBdcEvent);
    on<SelectBdcEvent>(_selectBdcEvent);
    on<SelectReservationEvent>(_selectReservationEvent);
  }
  Future<void> _searchContractEvent(
      SearchContractEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    dynamic result;
    try {
      switch (event.signatureAssociate) {
        case SignatureAssociate.contract:
          {
            result = await searchContractUseCase(SearchContractParams(
              keyWord: event.keyWord,
              isSigned: false,
            ));
            result.fold(
              (failure) {
                if (failure is NoConnectionFailure) {
                  emit(const ErrorState(
                      status: Status.error, message: noConnexionMessage));
                } else if (failure is ServerFailure) {
                  emit(const ErrorState(
                      status: Status.error, message: serverError));
                } else if (failure is TokenExpiredFailure) {
                  emit(const ErrorState(
                      status: Status.tokenExpired, message: tokenExpired));
                } else {
                  emit(const ErrorState(
                      status: Status.error, message: unknownError));
                }
              },
              (success) {
                emit(SearchContractState(
                    status: Status.success,
                    message: 'search contract result',
                    contracts: success));
              },
            );
          }
          break;
        case SignatureAssociate.reservation:
          {
            // result = await searchContractUseCase(SearchContractParams(
            //   keyWord: event.keyWord,
            //   isSigned: false,
            // ));
            result = await searchReservationUseCase(
                SearchReservationParams(filter: event.keyWord));
            result.fold(
              (failure) {
                if (failure is NoConnectionFailure) {
                  emit(const ErrorState(
                      status: Status.error, message: noConnexionMessage));
                } else if (failure is ServerFailure) {
                  emit(const ErrorState(
                      status: Status.error, message: serverError));
                } else if (failure is TokenExpiredFailure) {
                  emit(const ErrorState(
                      status: Status.tokenExpired, message: tokenExpired));
                } else {
                  emit(const ErrorState(
                      status: Status.error, message: unknownError));
                }
              },
              (success) {
                emit(SearchReservationState(
                    status: Status.success,
                    message: 'search réservation result',
                    reservations: success));
              },
            );
          }
          break;
        default:
          {
            result =
                await searchBdcUseCase(SearchBdcParams(filter: event.keyWord));
            result.fold(
              (failure) {
                if (failure is NoConnectionFailure) {
                  emit(const ErrorState(
                      status: Status.error, message: noConnexionMessage));
                } else if (failure is ServerFailure) {
                  emit(const ErrorState(
                      status: Status.error, message: serverError));
                } else if (failure is TokenExpiredFailure) {
                  emit(const ErrorState(
                      status: Status.tokenExpired, message: tokenExpired));
                } else {
                  emit(const ErrorState(
                      status: Status.error, message: unknownError));
                }
              },
              (success) {
                emit(
                  SearchBdcState(
                    status: Status.success,
                    message: 'search bdc result',
                    bdcs: success,
                  ),
                );
              },
            );
          }
          break;
      }
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

  Future _selectReservationEvent(
      SelectReservationEvent event, Emitter emit) async {
    emit(const SelectedContractState(
      status: Status.success,
      message: "success",
      isAccepted: false,
      isSigned: false,
    ));
  }

  Future _selectBdcEvent(SelectBdcEvent event, Emitter emit) async {
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
          emit(DownloadFileSuccessState(
            status: Status.uploadFileSuccess,
            message: "upload file success",
            isAccepted: event.isAccepted,
            isSigned: false,
            file: File(""),
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
      dynamic sign;
      switch (signatureAssociate) {
        case SignatureAssociate.contract:
          final payload = SignContractParams(
            numberContrat: event.contract.numberContrat!,
            signature: Signature(
              signature: urlPhoto,
              signatureDate: DateTime.now().formatDatePayload,
              isAccepted: event.isAccepted,
            ),
          );
           sign = await signContractUseCase(payload);
          break;
        case SignatureAssociate.reservation: {
          final payload = SignReservationParams(
            numberReservation: event.reservation.numberReservation!,
            signature: Signature(
              signature: urlPhoto,
              signatureDate: DateTime.now().formatDatePayload,
              isAccepted: event.isAccepted,
            ),
          );
           sign = await signReservationUseCase(payload);
        }
          break;
        default: {
          final payload = SignContractParams(
            numberContrat: event.bdc.numberContrat!,
            signature: Signature(
              signature: urlPhoto,
              signatureDate: DateTime.now().formatDatePayload,
              isAccepted: event.isAccepted,
            ),
          );
           sign = await signContractUseCase(payload);
        }
          break;
      }
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

  Future<void> _getPdfContractEvent(
      GetPdfContractEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final sign =
          await getPdfContractUsecase(GetPdfContractParams(contract: contract));
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
          emit(GetPdfContractSuccessState(
            status: Status.success,
            message: "GetPdfSuccess",
            uploadFile: success,
            isSigned: false,
            isAccepted: false,
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _getPdfReservationEvent(
      GetPdfReservationEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final sign = await getPdfReservationUsecase(
          GetPdfReservationParams(reservationId: reservation.id ?? ""));
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
          emit(GetPdfReservationSuccessState(
            status: Status.success,
            message: "GetPdfSuccess",
            uploadFile: success,
            isSigned: false,
            isAccepted: false,
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _getPdfBdcEvent(GetPdfBdcEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final sign = await getPdfBdcUsecase(GetPdfBdcParams(bdcId: bdc.id ?? ""));
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
          emit(GetPdfReservationSuccessState(
            status: Status.success,
            message: "GetPdfSuccess",
            uploadFile: success,
            isSigned: false,
            isAccepted: false,
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _downloadFileEvent(DownloadFileEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final sign = await downloadFileUsecase(
          DownloadFileParams(path: event.path, fileName: event.fileName));
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
          emit(DownloadFileSuccessState(
            status: Status.success,
            message: "GetPdfSuccess",
            file: success,
            isSigned: false,
            isAccepted: false,
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }
}
