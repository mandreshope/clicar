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
import 'package:clicar/app/presentation/pages/edl/types/billed_info.dart';
import 'package:clicar/app/presentation/pages/edl/types/camera_pos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:clicar/app/core/errors/message.dart';
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

  int currentCameraPos = 0;
  int currentCameraInteriorPos = 0;

  List<CameraPos> cameraInteriorPosListLock = [
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

  List<CameraPos> cameraPosListLock = [
    CameraPos(
      rotation: math.pi * 2,
      isActive: true,
      alignment: Alignment.centerLeft,
    ),
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
      rotation: math.pi,
      isActive: false,
      alignment: Alignment.centerRight,
    ),
    CameraPos(
      rotation: 4.1,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
    CameraPos(
      rotation: -math.pi / 2,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
    CameraPos(
      rotation: 5.4,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
  ];

  List<CameraPos> cameraPosList = [
    CameraPos(
      rotation: math.pi * 2,
      isActive: true,
      alignment: Alignment.centerLeft,
    ),
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
      rotation: math.pi,
      isActive: false,
      alignment: Alignment.centerRight,
    ),
    CameraPos(
      rotation: 4.1,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
    CameraPos(
      rotation: -math.pi / 2,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
    CameraPos(
      rotation: 5.4,
      isActive: false,
      alignment: Alignment.bottomCenter,
    ),
  ];

  List<BilledInfo> billedInfoListLock = [
    BilledInfo(
      label: "Remplacement PC AV (200 €)",
      amount: 200,
    ),
    BilledInfo(
      label: "Remplacement phare AV (400 €)",
      amount: 400,
    ),
    BilledInfo(
      label: "Roue de secours (100 €)",
      amount: 100,
    ),
    BilledInfo(
      label: "Lavage simplle (250 €)",
      amount: 250,
    ),
    BilledInfo(
      label: "Rapatriement véhicule (250 €)",
      amount: 250,
    ),
    BilledInfo(
      label: "Rayure (100 €)",
      amount: 100,
    ),
    BilledInfo(
      label: "Enfoncement (100 €)",
      amount: 100,
    ),
  ];

  List<BilledInfo> billedInfoList = [
    BilledInfo(
      label: "Remplacement PC AV (200 €)",
      amount: 200,
    ),
    BilledInfo(
      label: "Remplacement phare AV (400 €)",
      amount: 400,
    ),
    BilledInfo(
      label: "Roue de secours (100 €)",
      amount: 100,
    ),
    BilledInfo(
      label: "Lavage simplle (250 €)",
      amount: 250,
    ),
    BilledInfo(
      label: "Rapatriement véhicule (250 €)",
      amount: 250,
    ),
    BilledInfo(
      label: "Rayure (100 €)",
      amount: 100,
    ),
    BilledInfo(
      label: "Enfoncement (100 €)",
      amount: 100,
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
    on<SearchBilledInfoEvent>(_searchBilledInfoEvent,
        transformer: (Stream<SearchBilledInfoEvent> events, mapper) {
      return events.debounceTime(const Duration(seconds: 1)).switchMap(mapper);
    });
    on<SelectBilledInfoEvent>(_selectBilledInfoEvent);

    on<SelectContractEvent>(_selectContractEvent);
    on<UploadPhotosExteriorEvent>(_uploadPhotosExteriorEvent);
    on<UploadPhotosInteriorEvent>(_uploadPhotosInteriorEvent);
    on<SelectCameraPosEvent>(_selectCameraPosEvent);
    on<SelectCameraInteriorPosEvent>(_selectCameraInteriorPosEvent);
    on<AddFileOfCameraPosEvent>(_addFileOfCameraPosEvent);
    on<AddFileOfCameraInteriorPosEvent>(_addFileOfCameraInteriorPosEvent);
    on<UpdateFileOfCameraInteriorPosEvent>(_updateFileOfCameraInteriorPosEvent);
    on<UpdateFileOfCameraPosEvent>(_updateFileOfCameraPosEvent);
    on<UploadPhotoDefectsExteriorEvent>(_uploadPhotosDefectsExteriorEvent);
    on<EdlPhotosEvent>(_edlPhotosEvent);
    on<EdlPhotoDefectsEvent>(_edlPhotoDefectsEvent);
    on<EdlFuelLevelEvent>(_edlFuelLevelEvent);
    on<EdlMileageEvent>(_edlMileageEvent);
    on<EdlBilledInfoEvent>(_edlBilledInfoEvent);
    on<EdlDepartureNoteEvent>(_edlDepartureNoteEvent);
    on<EdlRetourNoteEvent>(_edlRetourNoteEvent);
    on<EdlDepartureSignEvent>(_edlDepartureSignEvent);
    on<EdlRetourSignEvent>(_edlRetourSignEvent);
    on<UploadSignatureFileEvent>(_uploadSignatureFileEvent);
    on<ReloadEvent>(_reloadEvent);
  }

  void resetUploadPhoto() {
    currentCameraPos = 0;
    currentCameraInteriorPos = 0;
    uploadSignatureFile = const UploadFile();
    uploadPhotosExterior = [];
    uploadPhotosInterior = [];
    uploadDefectsExterior = const UploadFile();
    cameraPosList = cameraPosListLock
        .map((e) => CameraPos(
              rotation: e.rotation,
              isActive: e.isActive,
              alignment: e.alignment,
            ))
        .toList();

    cameraInteriorPosList = cameraInteriorPosListLock
        .map((e) => CameraPos(
              label: e.label,
              isActive: e.isActive,
            ))
        .toList();
    billedInfoList = billedInfoListLock
        .map(
          (e) => BilledInfo(
            label: e.label,
            amount: e.amount,
          ),
        )
        .toList();
  }

  void resetAll() {
    debugPrint(logTrace);
    contract = const Contract();
    currentCameraPos = 0;
    currentCameraInteriorPos = 0;
    uploadSignatureFile = const UploadFile();
    uploadPhotosExterior = [];
    uploadPhotosInterior = [];
    uploadDefectsExterior = const UploadFile();
    cameraPosList = cameraPosListLock
        .map((e) => CameraPos(
              rotation: e.rotation,
              isActive: e.isActive,
              alignment: e.alignment,
            ))
        .toList();

    cameraInteriorPosList = cameraInteriorPosListLock
        .map((e) => CameraPos(
              label: e.label,
              isActive: e.isActive,
            ))
        .toList();
    billedInfoList = billedInfoListLock
        .map(
          (e) => BilledInfo(
            label: e.label,
            amount: e.amount,
          ),
        )
        .toList();
  }

  void _reloadEvent(ReloadEvent event, Emitter emit) {
    emit(state.copyWith(
        message: "reload state ${DateTime.now().microsecondsSinceEpoch}"));
  }

  Future<void> _searchContractEvent(
      SearchContractEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      SearchContractParams payload = SearchContractParams(
        keyWord: event.keyWord,
        isSigned: true,
        hasStartingEdl: false,
        hasEndingEdl: false,
      );
      if (event.typeEdl == TypeEdl.retour) {
        payload = SearchContractParams(
          keyWord: event.keyWord,
          isSigned: true,
          hasStartingEdl: true,
          hasEndingEdl: false,
        );
      }
      final result = await searchContractUseCase(payload);
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

  Future<void> _searchBilledInfoEvent(
      SearchBilledInfoEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    final result = billedInfoList
        .where((e) =>
            e.label.toLowerCase().contains(event.keyWord.toLowerCase().trim()))
        .toList();
    await Future.delayed(const Duration(seconds: 1));
    emit(
      SearchBilledInfoSuccessState(
          result: result, status: Status.success, message: 'update'),
    );
  }

  void _selectBilledInfoEvent(SelectBilledInfoEvent event, Emitter emit) {
    billedInfoList[billedInfoList.indexOf(event.billedInfo)].isSelected =
        !event.billedInfo.isSelected;
    emit(
      SearchBilledInfoSuccessState(
          result: event.result,
          status: Status.success,
          message: 'success',
          tag: "${event.billedInfo.label}${!event.billedInfo.isSelected}"),
    );
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
      emit(const ErrorState(status: Status.error, message: unknownError));
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
      emit(const ErrorState(status: Status.error, message: unknownError));
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
      emit(const ErrorState(status: Status.error, message: unknownError));
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
    if (currentCameraPos < (cameraPosList.length - 1)) {
      cameraPosList[currentCameraPos + 1].isActive = true;
    }
    if (currentCameraPos < (cameraPosList.length - 1)) {
      currentCameraPos++;
    }
    emit(
      AddFileOfCameraPosState(
        status: Status.success,
        message:
            "$currentCameraPos ${cameraPosList[currentCameraPos].file} reload",
      ),
    );
  }

  void _addFileOfCameraInteriorPosEvent(
      AddFileOfCameraInteriorPosEvent event, Emitter emit) {
    cameraInteriorPosList[currentCameraInteriorPos].file = event.file;
    cameraInteriorPosList[currentCameraInteriorPos].hasPhoto = true;
    if (currentCameraInteriorPos < (cameraInteriorPosList.length - 1)) {
      cameraInteriorPosList[currentCameraInteriorPos + 1].isActive = true;
    }
    if (currentCameraInteriorPos < (cameraInteriorPosList.length - 1)) {
      currentCameraInteriorPos++;
    }
    emit(
      AddFileOfCameraPosState(
        status: Status.success,
        message:
            "$currentCameraInteriorPos ${cameraInteriorPosList[currentCameraInteriorPos].file} reload",
      ),
    );
  }

  void _updateFileOfCameraInteriorPosEvent(
      UpdateFileOfCameraInteriorPosEvent event, emit) {
    cameraInteriorPosList[event.index].file = event.file;
    cameraInteriorPosList[event.index].hasPhoto = true;
    emit(
      AddFileOfCameraPosState(
        status: Status.success,
        message:
            "${event.index} ${cameraInteriorPosList[event.index].file} reload",
      ),
    );
  }

  void _updateFileOfCameraPosEvent(UpdateFileOfCameraPosEvent event, emit) {
    cameraPosList[event.index].file = event.file;
    cameraPosList[event.index].hasPhoto = true;
    emit(
      AddFileOfCameraPosState(
        status: Status.success,
        message: "${event.index} ${cameraPosList[event.index].file} reload",
      ),
    );
  }

  ///add contract photos exterior & interior
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
      final result = typeEdl == TypeEdl.departure
          ? await edlDepartureUseCase(EdlDepartureParams(data: data))
          : await edlRetourUseCase(EdlRetourParams(data: data));
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
          contract = success;
          emit(const EdlPhotosSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
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
        "faults": [urlPhoto],
      };
      final result = typeEdl == TypeEdl.departure
          ? await edlDepartureUseCase(EdlDepartureParams(data: data))
          : await edlRetourUseCase(EdlRetourParams(data: data));
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
          contract = success;
          emit(const EdlPhotoDefectsSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _edlFuelLevelEvent(EdlFuelLevelEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        "fuelQuantity": event.fuel,
      };
      final result = typeEdl == TypeEdl.departure
          ? await edlDepartureUseCase(EdlDepartureParams(data: data))
          : await edlRetourUseCase(EdlRetourParams(data: data));
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
          contract = success;
          emit(const EdlFuelLevelSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _edlMileageEvent(EdlMileageEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        "km": event.mileage,
      };
      final result = typeEdl == TypeEdl.departure
          ? await edlDepartureUseCase(EdlDepartureParams(data: data))
          : await edlRetourUseCase(EdlRetourParams(data: data));
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
          contract = success;
          emit(const EdlMileageSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _edlBilledInfoEvent(
      EdlBilledInfoEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        "billedInfos": [
          ...billedInfoList
              .where((e) => e.isSelected)
              .map((e) => e.toMap())
              .toList()
        ],
      };
      final result = typeEdl == TypeEdl.departure
          ? await edlDepartureUseCase(EdlDepartureParams(data: data))
          : await edlRetourUseCase(EdlRetourParams(data: data));
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
          contract = success;
          emit(const EdlBilledInfoSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
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
          contract = success;
          emit(const EdlDepartureNoteSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _edlRetourNoteEvent(
      EdlRetourNoteEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final data = {
        "numberContrat": "${contract.numberContrat}",
        "conditionDate": DateTime.now().formatDatePayload,
        "comment": event.note,
      };
      final result = await edlRetourUseCase(EdlRetourParams(data: data));
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
          contract = success;
          emit(const EdlDepartureNoteSuccessState(
            status: Status.success,
            message: "",
          ));
        },
      );
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
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
      emit(const ErrorState(status: Status.error, message: unknownError));
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
      emit(const ErrorState(status: Status.error, message: unknownError));
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
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }
}
