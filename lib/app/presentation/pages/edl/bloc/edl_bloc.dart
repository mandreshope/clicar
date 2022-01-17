import 'dart:async';
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
import 'package:clicar/app/domain/usecases/edl/edl_departure_usecase.dart';
import 'package:clicar/app/domain/usecases/edl/edl_retour_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_multi_file_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/presentation/pages/edl/enums/type_edl.dart';
import 'package:clicar/app/presentation/pages/edl/widgets/camera_pos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:math' as math;

part 'edl_event.dart';
part 'edl_state.dart';

class EdlBloc extends Bloc<EdlEvent, BaseState> {
  final SearchContractUseCase searchContractUseCase;
  final UploadSingleFileUseCase uploadSingleFileUseCase;
  final UploadMultiFileUseCase uploadMultiFileUseCase;
  final SignContractUseCase signContractUseCase;
  final EdlDepartureUseCase edlDepartureUseCase;
  final EdlRetourUseCase edlRetourUseCase;

  TypeEdl typeEdl = TypeEdl.departure;

  Contract contract = const Contract();
  UploadFile uploadSignatureFile = const UploadFile();
  List<UploadFile> uploadPhotosExterior = [];
  List<UploadFile> uploadPhotosInterior = [];
  UploadFile uploadDefectsExterior = const UploadFile();

  int currentCameraPos = 3;
  int currentCameraInteriorPos = 0;

  List<CameraPos> cameraInteriorPosList = [
    CameraPos(
      label: "1- Tableau de bord",
      isActive: true,
    ),
    CameraPos(
      label: "2- Sièges avant",
      isActive: false,
    ),
    CameraPos(
      label: "3- Banquette arrière",
      isActive: false,
    ),
    CameraPos(
      label: "4- coffre",
      isActive: false,
    ),
  ];

  List<CameraPos> cameraPosList = [
    CameraPos(
      rotation: math.pi / 3,
      isActive: false,
      alignment: Alignment.topCenter,
    ),
    CameraPos(
      rotation: math.pi / 2,
      isActive: false,
      alignment: Alignment.topCenter,
    ),
    CameraPos(
      rotation: 2.2,
      isActive: false,
      alignment: Alignment.topCenter,
    ),
    CameraPos(
      rotation: math.pi * 2,
      isActive: true,
      alignment: Alignment.centerLeft,
    ),
    CameraPos(
      rotation: math.pi,
      isActive: false,
      alignment: Alignment.centerRight,
    ),
    CameraPos(
      rotation: 5.4,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
    CameraPos(
      rotation: -math.pi / 2,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
    CameraPos(
      rotation: 4.1,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
  ];

  EdlBloc({
    required this.signContractUseCase,
    required this.uploadSingleFileUseCase,
    required this.searchContractUseCase,
    required this.uploadMultiFileUseCase,
    required this.edlDepartureUseCase,
    required this.edlRetourUseCase,
  }) : super(const EdlInitial(status: Status.initial, message: "intial")) {
    on<SearchContractEvent>(_searchContractEvent,
        transformer: (Stream<SearchContractEvent> events, mapper) {
      return events.debounceTime(const Duration(seconds: 1)).switchMap(mapper);
    });
    on<SelectContractEvent>(_selectContractEvent);
    on<UploadPhotosExteriorEvent>(_uploadPhotosExteriorEvent);
    on<UploadPhotosInteriorEvent>(_uploadPhotosInteriorEvent);
    on<SelectCameraPosEvent>(_selectCameraPosEvent);
    on<SelectCameraInteriorPosEvent>(_selectCameraInteriorPosEvent);
    on<AddFileOfCameraPosEvent>(_addFileOfCameraPosEvent);
    on<AddFileOfCameraInteriorPosEvent>(_addFileOfCameraInteriorPosEvent);
    on<UploadPhotoDefectsExteriorEvent>(_uploadPhotosDefectsExteriorEvent);
    on<EdlPhotosEvent>(_edlPhotosEvent);
    on<EdlPhotoDefectsEvent>(_edlPhotoDefectsEvent);
    on<EdlFuelLevelEvent>(_edlFuelLevelEvent);
    on<EdlMileageEvent>(_edlMileageEvent);
    on<EdlDepartureNoteEvent>(_edlDepartureNoteEvent);
    on<EdlRetourNoteEvent>(_edlRetourNoteEvent);
    on<EdlDepartureSignEvent>(_edlDepartureSignEvent);
    on<EdlRetourSignEvent>(_edlRetourSignEvent);
    on<UploadSignatureFileEvent>(_uploadSignatureFileEvent);
  }

  void reset() {
    debugPrint(logTrace);
    contract = const Contract();
    uploadSignatureFile = const UploadFile();
    uploadPhotosExterior = [];
    uploadPhotosInterior = [];
    uploadDefectsExterior = const UploadFile();
  }

  Future<void> _searchContractEvent(
      SearchContractEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final result = await searchContractUseCase(SearchContractParams(
        keyWord: event.keyWord,
      ));
      result.fold(
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
          emit(SearchContractState(
              status: Status.success,
              message: 'search contract result',
              contracts: success));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
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

  Future<void> _uploadPhotosExteriorEvent(
      UploadPhotosExteriorEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final upload = await uploadMultiFileUseCase(
        UploadMultiFileParams(
          files: event.files,
          fileDestination: "edl",
        ),
      );
      upload.fold(
        (failure) {
          emit(const ErrorState(
            status: Status.uploadFileFailed,
            message: "upload file failed",
          ));
        },
        (success) async {
          uploadPhotosExterior = success;
          emit(const UploadPhotosExteriorSuccess(
            status: Status.uploadFileSuccess,
            message: "upload file success",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _uploadPhotosInteriorEvent(
      UploadPhotosInteriorEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final upload = await uploadMultiFileUseCase(
        UploadMultiFileParams(
          files: event.files,
          fileDestination: "edl",
        ),
      );
      upload.fold(
        (failure) {
          emit(const ErrorState(
            status: Status.uploadFileFailed,
            message: "upload file failed",
          ));
        },
        (success) async {
          uploadPhotosInterior = success;
          emit(const UploadPhotosInteriorSuccess(
            status: Status.uploadFileSuccess,
            message: "upload file success",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _uploadPhotosDefectsExteriorEvent(
      UploadPhotoDefectsExteriorEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final upload = await uploadSingleFileUseCase(
        UploadSingleFileParams(
          file: event.file,
          fileDestination: "edl",
        ),
      );
      upload.fold(
        (failure) {
          emit(const ErrorState(
            status: Status.uploadFileFailed,
            message: "upload file failed",
          ));
        },
        (success) async {
          uploadDefectsExterior = success;
          emit(const UploadPhotoDefectsExteriorSuccessState(
            status: Status.uploadFileSuccess,
            message: "upload file success",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  void _selectCameraPosEvent(SelectCameraPosEvent event, Emitter emit) {
    for (var e in cameraPosList) {
      e.isActive = false;
    }
    event.cameraPos.isActive = !event.cameraPos.isActive;
    currentCameraPos = cameraPosList.indexOf(event.cameraPos);
    emit(
      SelectCameraPosState(
        cameraPos: event.cameraPos,
        status: Status.success,
        message: "reload ${event.cameraPos}",
      ),
    );
  }

  void _selectCameraInteriorPosEvent(
      SelectCameraInteriorPosEvent event, Emitter emit) {
    for (var e in cameraInteriorPosList) {
      e.isActive = false;
    }
    event.cameraPos.isActive = !event.cameraPos.isActive;
    currentCameraInteriorPos = cameraInteriorPosList.indexOf(event.cameraPos);
    emit(
      SelectCameraPosState(
        cameraPos: event.cameraPos,
        status: Status.success,
        message: "reload ${event.cameraPos}",
      ),
    );
  }

  void _addFileOfCameraPosEvent(AddFileOfCameraPosEvent event, Emitter emit) {
    cameraPosList[currentCameraPos].file = event.file;
    cameraPosList[currentCameraPos].hasPhoto = true;
    emit(
      const AddFileOfCameraPosState(
        status: Status.success,
        message: "reload",
      ),
    );
  }

  void _addFileOfCameraInteriorPosEvent(
      AddFileOfCameraInteriorPosEvent event, Emitter emit) {
    cameraInteriorPosList[currentCameraInteriorPos].file = event.file;
    cameraInteriorPosList[currentCameraInteriorPos].hasPhoto = true;
    emit(
      const AddFileOfCameraPosState(
        status: Status.success,
        message: "reload",
      ),
    );
  }

  Future<void> _edlPhotosEvent(EdlPhotosEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      //https://api-new.clicar.fr/uploadFile/file/signatures/41-418338_success1640557427707.png
      /*final urlPhoto =
              "${RemoteConfig.baseUrl}/uploadFile/file/signatures/${success.filename}";*/
      /// add baseUrl to display this path

      List<String> photosExterior = uploadPhotosExterior.map((e) {
        final urlPhoto = "$edlServerFilePath${e.filename}";
        return urlPhoto;
      }).toList();

      List<String> photosInterior = uploadPhotosInterior.map((e) {
        final urlPhoto = "$edlServerFilePath${e.filename}";
        return urlPhoto;
      }).toList();

      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        "conditions": [...photosExterior, ...photosInterior],
        //"comment": "quelconque commentaire",
        //"km": "2000",
        //"fuelQuantity": "15",
        //"faults": ["Défaut1", "Défaut2"]
      };
      final result = await edlDepartureUseCase(EdlDepartureParams(data: data));
      result.fold(
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
          contract = success;
          emit(const EdlPhotosSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _edlPhotoDefectsEvent(
      EdlPhotoDefectsEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      //https://api-new.clicar.fr/uploadFile/file/signatures/41-418338_success1640557427707.png
      /*final urlPhoto =
              "${RemoteConfig.baseUrl}/uploadFile/file/signatures/${success.filename}";*/
      /// add baseUrl to display this path

      final urlPhoto = "$edlServerFilePath${uploadDefectsExterior.filename}";

      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        // "conditions": [imgUrl1, imgUrl2],
        //"comment": "quelconque commentaire",
        //"km": "2000",
        //"fuelQuantity": "15",
        "faults": [urlPhoto],
      };
      final result = await edlDepartureUseCase(EdlDepartureParams(data: data));
      result.fold(
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
          contract = success;
          emit(const EdlPhotoDefectsSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _edlFuelLevelEvent(EdlFuelLevelEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        // "conditions": [imgUrl1, imgUrl2],
        //"comment": "quelconque commentaire",
        //"km": "2000",
        "fuelQuantity": event.fuel,
        // "faults": [imgUrl1, imgUrl2],
      };
      final result = await edlDepartureUseCase(EdlDepartureParams(data: data));
      result.fold(
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
          contract = success;
          emit(const EdlFuelLevelSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _edlMileageEvent(EdlMileageEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        // "conditions": [imgUrl1, imgUrl2],
        //"comment": "quelconque commentaire",
        "km": event.mileage,
        //"fuelQuantity": "15",
        // "faults": [imgUrl1, imgUrl2],
      };
      final result = await edlDepartureUseCase(EdlDepartureParams(data: data));
      result.fold(
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
          contract = success;
          emit(const EdlMileageSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _edlDepartureNoteEvent(
      EdlDepartureNoteEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        // "conditions": [imgUrl1, imgUrl2],
        "comment": event.note,
        //"km": "1000",
        //"fuelQuantity": "15",
        // "faults": [imgUrl1, imgUrl2],
      };
      final result = await edlDepartureUseCase(EdlDepartureParams(data: data));
      result.fold(
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
          contract = success;
          emit(const EdlDepartureNoteSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _edlRetourNoteEvent(
      EdlRetourNoteEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        // "conditions": [imgUrl1, imgUrl2],
        "comment": event.note,
        //"km": "1000",
        //"fuelQuantity": "15",
        // "faults": [imgUrl1, imgUrl2],
      };
      final result = await edlDepartureUseCase(EdlDepartureParams(data: data));
      result.fold(
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
          contract = success;
          emit(const EdlDepartureNoteSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _edlDepartureSignEvent(
      EdlDepartureSignEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final urlPhoto = "$edlServerFilePath${uploadSignatureFile.filename}";
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "signatureDate": DateTime.now().formatDatePayload,
        "signature": urlPhoto,
        "isAccepted": event.isAccepted,
      };
      final result = await edlDepartureUseCase(EdlDepartureParams(data: data));
      result.fold(
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
          contract = success;
          emit(SelectedContractState(
            status: Status.signed,
            message: "signed",
            isAccepted: event.isAccepted,
            isSigned: true,
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _edlRetourSignEvent(
      EdlRetourSignEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final urlPhoto = "$edlServerFilePath${uploadSignatureFile.filename}";
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "signatureDate": DateTime.now().formatDatePayload,
        "signature": urlPhoto,
        "isAccepted": event.isAccepted,
      };
      final result = await edlRetourUseCase(EdlRetourParams(data: data));
      result.fold(
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
          contract = success;
          emit(SelectedContractState(
            status: Status.signed,
            message: "signed",
            isAccepted: event.isAccepted,
            isSigned: true,
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
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
          uploadSignatureFile = success;
          emit(SelectedContractState(
            status: Status.uploadFileSuccess,
            message: "upload file success",
            isAccepted: event.isAccepted,
            isSigned: false,
          ));
        },
      );
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }
}
