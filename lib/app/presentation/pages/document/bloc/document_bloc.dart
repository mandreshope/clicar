import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/contravention/search_contravention_usecase.dart';
import 'package:clicar/app/domain/usecases/customer/customer_update_usecase.dart';
import 'package:clicar/app/domain/usecases/customer/search_customer_usecase.dart';
import 'package:clicar/app/domain/usecases/driver/driver_update_usecase.dart';
import 'package:clicar/app/domain/usecases/driver/search_driver_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_multi_file_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/domain/usecases/vehicle/search_vehicle_usecase.dart';
import 'package:clicar/app/domain/usecases/vehicle/vehicle_update_usecase.dart';
import 'package:clicar/app/presentation/pages/document/enums/document_associate.dart';
import 'package:clicar/app/presentation/pages/document/types/document_item.dart';
import 'package:clicar/app/presentation/pages/document/types/document_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:clicar/app/core/errors/message.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:rxdart/rxdart.dart';
import 'package:clicar/app/core/utils/extension.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, BaseState> {
  final UploadMultiFileUseCase uploadMultiFileUseCase;
  final UploadSingleFileUseCase uploadSingleFileUseCase;
  final CustomerUpdateUseCase customerUpdateUseCase;
  final SearchCustomerUseCase searchCustomerUseCase;
  final DriverUpdateUseCase driverUpdateUseCase;
  final SearchDriverUseCase searchDriverUseCase;
  final VehicleUpdateUseCase vehicleUpdateUseCase;
  final SearchVehicleUseCase searchVehicleUseCase;
  final SearchContraventionUseCase searchContraventionUseCase;

  List<DocumentPicker> documentPickers = [];

  List<UploadFile> documentsUploaded = [];

  int documentsUploadedCounter = 0;

  ImageSource? imageSource;

  List<DocumentItem> typesLock = [
    DocumentItem(type: "CIN_recto", label: "Carte d’identité recto"),
    DocumentItem(type: "CIN_verso", label: "Carte d’identité verso"),
    DocumentItem(type: "Passeport", label: "Passeport"),
    DocumentItem(type: "Justificatif", label: "justificatif de domicile"),
    DocumentItem(type: "kbis", label: "K-bis"),
    DocumentItem(type: "CVTC", label: "Carte VTC"),
    DocumentItem(type: "Permis_recto", label: "Permis de conduire recto"),
    DocumentItem(type: "Permis_verso", label: "Permis de conduire verso"),
    DocumentItem(type: "Vehicle_CG", label: "Carte grise"),
    DocumentItem(type: "Vehicle_CPIP", label: "CPI provisoire"),
    DocumentItem(type: "Vehicle_ADV", label: "Assurance du véhicule"),
    DocumentItem(type: "Vehicle_AP", label: "Assurance passagers"),
    DocumentItem(type: "Vehicle_CT", label: "Contrôle technique"),
    DocumentItem(type: "Autres", label: "Autres")
  ];

  List<DocumentItem> types = [
    // DocumentItem(type: "CIN_recto", label: "Carte d’identité recto"),
    // DocumentItem(type: "CIN_verso", label: "Carte d’identité verso"),
    // DocumentItem(type: "Passeport", label: "Passeport"),
    // DocumentItem(type: "Justificatif", label: "justificatif de domicile"),
    // DocumentItem(type: "kbis", label: "K-bis"),
    // DocumentItem(type: "CVTC", label: "Carte VTC"),
    // DocumentItem(type: "Permis_recto", label: "Permis de conduire recto"),
    // DocumentItem(type: "Permis_verso", label: "Permis de conduire verso"),
    // DocumentItem(type: "Vehicle_CG", label: "Carte grise"),
    // DocumentItem(type: "Vehicle_CPIP", label: "CPI provisoire"),
    // DocumentItem(type: "Vehicle_ADV", label: "Assurance du véhicule"),
    // DocumentItem(type: "Vehicle_AP", label: "Assurance passagers"),
    // DocumentItem(type: "Vehicle_CT", label: "Contrôle technique"),
    // DocumentItem(type: "Autres", label: "Autres")
  ];

  //List types du document pour chaque associer
  List<DocumentItem> typesDocForClient = [
    DocumentItem(type: "CIN_recto", label: "Carte d’identité recto"),
    DocumentItem(type: "CIN_verso", label: "Carte d’identité verso"),
    DocumentItem(type: "Passport", label: "Passport"),
    DocumentItem(type: "Justificatif", label: "justificatif de domicile"),
    DocumentItem(type: "kbis", label: "K-bis"),
    DocumentItem(type: "CVTC", label: "Carte VTC"),
    DocumentItem(type: "Autres", label: "Autres"),
  ];
  List<DocumentItem> typesDocForDriver = [
    DocumentItem(type: "CIN_recto", label: "Carte d’identité recto"),
    DocumentItem(type: "CIN_verso", label: "Carte d’identité verso"),
    DocumentItem(type: "Passport", label: "Passport"),
    DocumentItem(type: "Justificatif", label: "justificatif de domicile"),
    DocumentItem(type: "Permis_recto", label: "Permis de conduire recto"),
    DocumentItem(type: "Permis_verso", label: "Permis de conduire verso"),
  ];
  List<DocumentItem> typesDocForVehicule = [
    DocumentItem(type: "carte_grise", label: "Carte grise"),
    DocumentItem(type: "CPI", label: "CPI provisoire"),
    DocumentItem(type: "Assurance_vehicule", label: "Assurance de véhicule"),
    DocumentItem(type: "Assurance_passagers", label: "Assurance passagers"),
    DocumentItem(type: "c_technique", label: "Contrôle technique"),
    DocumentItem(type: "Autres", label: "Autres"),
  ];
  List<DocumentItem> typesDocForContravention = [
    DocumentItem(type: "FPS", label: "FPS"),
    DocumentItem(type: "ANTAI", label: "ANTAI"),
    DocumentItem(type: "etrangere", label: "Étrangère"),
    DocumentItem(type: "majoration", label: "Majoration"),
    DocumentItem(type: "Autres", label: "Autres"),
  ];
  List<DocumentItem> typesDocForClientGFlotte = [
    DocumentItem(type: "constat", label: "Constat"),
    DocumentItem(type: "DVF", label: "Déclaration circonstanciée de fait"),
    DocumentItem(type: "Proces_verbal", label: "Procès verbal"),
    DocumentItem(type: "Main_courante", label: "Main courante"),
    DocumentItem(type: "Mise_en_cause", label: "Mise en cause"),
  ];
  //

  List<DocumentItem> associatesLock = [
    DocumentItem(type: "Conducteur", label: "Conducteur"),
    DocumentItem(type: "Client", label: "Client"),
    DocumentItem(type: "Vehicule", label: "Véhicule"),
  ];

  List<DocumentItem> associates = [
    DocumentItem(type: "Conducteur", label: "Conducteur"),
    DocumentItem(type: "Client", label: "Client"),
    DocumentItem(type: "Vehicule", label: "Véhicule"),
    DocumentItem(type: "Contraventions", label: "Contraventions"),
    DocumentItem(type: "Gestion de flotte", label: "Gestion de flotte"),
  ];

  DocumentBloc({
    required this.uploadMultiFileUseCase,
    required this.uploadSingleFileUseCase,
    required this.searchVehicleUseCase,
    required this.vehicleUpdateUseCase,
    required this.searchDriverUseCase,
    required this.driverUpdateUseCase,
    required this.searchCustomerUseCase,
    required this.customerUpdateUseCase,
    required this.searchContraventionUseCase
  }) : super(const BaseState(status: Status.initial, message: "initial")) {
    on<AddDocumentPickerEvent>(_addDocumentPickerEvent);
    on<UpdateDocumentPickerEvent>(_updateDocumentPickerEvent);
    on<SelectTypeDocumentEvent>(_selectTypeDocumentEvent);
    on<SelectAssociatedDocumentEvent>(_selectAssociatedDocumentEvent);
    on<SelectAssociatedIdDocumentEvent>(_selectAssociatedIdDocumentEvent);
    on<UploadDocumentsEvent>(_uploadDocumentsEvent);
    on<SearchAssociateEvent>(_searchAssociateEvent,
        transformer: (Stream<SearchAssociateEvent> events, mapper) {
      return events.debounceTime(const Duration(seconds: 1)).switchMap(mapper);
    });
    on<AssociateDocumentsEvent>(_associateDocumentsEvent);
    on<OtherDocumentType>(_otherDocumentType);
  }

  void reset() {
    documentPickers.clear();
    documentsUploaded.clear();
    documentsUploadedCounter = 0;
    imageSource = null;
  }

  void _addDocumentPickerEvent(AddDocumentPickerEvent event, Emitter emit) {
    documentPickers.add(DocumentPicker(file: event.file));
    emit(BaseState(status: Status.success, message: "file: ${event.file}"));
  }

  void _updateDocumentPickerEvent(
      UpdateDocumentPickerEvent event, Emitter emit) {
    documentPickers[event.index].file = event.file;
    emit(BaseState(status: Status.success, message: "file: ${event.file}"));
  }

  void _selectTypeDocumentEvent(SelectTypeDocumentEvent event, Emitter emit) {
    documentPickers[documentPickers.indexOf(event.documentPicker)].type =
        event.documentItem;

    // documentPickers[documentPickers.indexOf(event.documentPicker)].associated =
    //     null;
    // associates = associatesLock
    //     .map((e) => e.copyWith(
    //           label: e.label,
    //           id: e.id,
    //           type: e.type,
    //         ))
    //     .toList();

    // if (["CIN_recto", "CIN_verso", "Passeport", "Permis_recto", "Permis_verso"]
    //     .contains(event.documentItem.type)) {
    //   associates = associatesLock
    //       .where((e) => ["Conducteur", "Client"].contains(e.type))
    //       .toList();
    // } else if ([
    //   "Vehicle_CG",
    //   "Vehicle_CPIP",
    //   "Vehicle_ADV",
    //   "Vehicle_AP",
    //   "Vehicle_CT",
    // ].contains(event.documentItem.type)) {
    //   associates =
    //       associatesLock.where((e) => ["Vehicule"].contains(e.type)).toList();
    // }
    emit(BaseState(
        status: Status.success,
        message:
            "tag: ${event.documentPicker.file}${event.documentItem.type}"));
  }

  void _selectAssociatedDocumentEvent(
      SelectAssociatedDocumentEvent event, Emitter emit) {
    documentPickers[documentPickers.indexOf(event.documentPicker)].type = null;
    switch (event.documentItem.type) {
      case "Conducteur":
        {
          types = typesDocForDriver;
        }
        break;
      case "Client":
        {
          types = typesDocForClient;
        }
        break;
      case "Vehicule":
        {
          types = typesDocForVehicule;
        }
        break;
      case "Contraventions":
        {
          types = typesDocForContravention;
        }
        break;
      default:
        types = typesDocForClientGFlotte;
        break;
    }
    documentPickers[documentPickers.indexOf(event.documentPicker)].associated =
        event.documentItem;
    emit(BaseState(
        status: Status.success,
        message:
            "tag: ${event.documentPicker.file}${event.documentItem.type}"));
  }

  void _selectAssociatedIdDocumentEvent(
      SelectAssociatedIdDocumentEvent event, Emitter emit) {
    documentPickers[documentPickers.indexOf(event.documentPicker)]
        .associatedSelectedId = event.documentItem.id;
    documentPickers[documentPickers.indexOf(event.documentPicker)]
        .associatedSelectedName = event.documentItem.label;
    emit(SearchAssociateSuccessState(
        status: Status.success,
        message: '',
        tag:
            "tag: ${event.documentPicker.file}${event.documentItem.type}${DateTime.now().microsecondsSinceEpoch}",
        result: event.result));
  }

  Future<void> _uploadDocumentsEvent(
      UploadDocumentsEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      final documentPicker = documentPickers.where((e) =>
          e.type != null &&
          e.associated != null &&
          e.associatedSelectedName != null);
      for (final DocumentPicker item in documentPicker) {
        debugPrint('Original path: ${item.file.path}');
        String dir = path.dirname(item.file.path);
        String newPath = path.join(
            dir, "${item.associated!.type}-${item.associatedSelectedId}.jpg");
        debugPrint('NewPath: $newPath');
        File newFile = item.file.renameSync(newPath);
        item.file = newFile;
        final upload = await uploadSingleFileUseCase(
          UploadSingleFileParams(
            file: newFile,
            fileDestination: item.type!.type,
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
            documentsUploaded.clear();
            documentsUploaded.add(success);
            emit(const UploadDocumentsSuccessState(
              status: Status.loading,
              message: "Upload file success",
            ));
          },
        );
      }
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _searchAssociateEvent(
      SearchAssociateEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      if (event.documentAssociate == "Client") {
        final result = await searchCustomerUseCase(SearchCustomerParams(
          filter: event.keyWord,
        ));
        result.fold(
          (failure) {
            if (failure is NoConnectionFailure) {
              emit(const ErrorState(
                  status: Status.error, message: noConnexionMessage));
            } else if (failure is ServerFailure) {
              emit(
                  const ErrorState(status: Status.error, message: serverError));
            } else if (failure is TokenExpiredFailure) {
              emit(const ErrorState(
                  status: Status.tokenExpired, message: tokenExpired));
            } else {
              emit(const ErrorState(
                  status: Status.error, message: unknownError));
            }
          },
          (success) {
            final splitResult =
                success.length > 20 ? success.sublist(0, 10) : success;
            emit(SearchAssociateSuccessState(
                result: splitResult
                    .map((e) => DocumentItem(
                        id: e.id,
                        type: "Client",
                        label: "${e.firstName} ${e.lastName}"))
                    .toList(),
                status: Status.success,
                message: 'update ${event.keyWord} ${event.documentAssociate}'));
          },
        );
      } else if (event.documentAssociate == "Conducteur") {
        final result = await searchDriverUseCase(SearchDriverParams(
          filter: event.keyWord,
        ));
        result.fold(
          (failure) {
            if (failure is NoConnectionFailure) {
              emit(const ErrorState(
                  status: Status.error, message: noConnexionMessage));
            } else if (failure is ServerFailure) {
              emit(
                  const ErrorState(status: Status.error, message: serverError));
            } else if (failure is TokenExpiredFailure) {
              emit(const ErrorState(
                  status: Status.tokenExpired, message: tokenExpired));
            } else {
              emit(const ErrorState(
                  status: Status.error, message: unknownError));
            }
          },
          (success) {
            final splitResult =
                success.length > 20 ? success.sublist(0, 10) : success;
            emit(SearchAssociateSuccessState(
                result: splitResult
                    .map((e) => DocumentItem(
                        id: e.id,
                        type: "Conducteur",
                        label: "${e.firstName} ${e.lastName}"))
                    .toList(),
                status: Status.success,
                message: 'update ${event.keyWord} ${event.documentAssociate}'));
          },
        );
      } else if (event.documentAssociate == "Vehicule") {
        final result = await searchVehicleUseCase(SearchVehicleParams(filters: {
          "keyword": event.keyWord,
          "available": true,
          "working": false,
          "isBlocked": false
        }));
        result.fold(
          (failure) {
            if (failure is NoConnectionFailure) {
              emit(const ErrorState(
                  status: Status.error, message: noConnexionMessage));
            } else if (failure is ServerFailure) {
              emit(
                  const ErrorState(status: Status.error, message: serverError));
            } else if (failure is TokenExpiredFailure) {
              emit(const ErrorState(
                  status: Status.tokenExpired, message: tokenExpired));
            } else {
              emit(const ErrorState(
                  status: Status.error, message: unknownError));
            }
          },
          (success) {
            final splitResult =
                success.length > 20 ? success.sublist(0, 10) : success;
            emit(SearchAssociateSuccessState(
                result: splitResult
                    .map((e) => DocumentItem(
                        id: e.id,
                        type: "Vehicule",
                        label: "${e.number} ${e.serialNumber}"))
                    .toList(),
                status: Status.success,
                message: 'update ${event.keyWord} ${event.documentAssociate}'));
          },
        );
      } else if (event.documentAssociate == "Contraventions") {
        final result = await searchContraventionUseCase(SearchContraventionParams(
          filter: event.keyWord,
        ));
        result.fold(
          (failure) {
            if (failure is NoConnectionFailure) {
              emit(const ErrorState(
                  status: Status.error, message: noConnexionMessage));
            } else if (failure is ServerFailure) {
              emit(
                  const ErrorState(status: Status.error, message: serverError));
            } else if (failure is TokenExpiredFailure) {
              emit(const ErrorState(
                  status: Status.tokenExpired, message: tokenExpired));
            } else {
              emit(const ErrorState(
                  status: Status.error, message: unknownError));
            }
          },
          (success) {
            final splitResult =
                success.length > 20 ? success.sublist(0, 10) : success;
            emit(SearchAssociateSuccessState(
                result: splitResult
                    .map((e) => DocumentItem(
                        id: e.id,
                        type: "Contravention",
                        label: "${e.immat} ${e.immat}"))
                    .toList(),
                status: Status.success,
                message: 'update ${event.keyWord} ${event.documentAssociate}'));
          },
        );
      } else if (event.documentAssociate == "Gestion de flotte") {
        emit(SearchAssociateSuccessState(
            result: const [],
            status: Status.success,
            message: 'update ${event.keyWord} ${event.documentAssociate}'));
      }
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  Future<void> _associateDocumentsEvent(event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      for (UploadFile uploadFile in documentsUploaded) {
        print(uploadFile);
        final photoName = uploadFile.originalname?.split(".");
        final splitPhotoName = photoName?.first.split("-");
        final String? associate = splitPhotoName?.first;
        final String? associateId = splitPhotoName?.last;
        DocumentAssociate documentAssociate = associate == "Conducteur"
            ? DocumentAssociate.driver
            : associate == "Client"
                ? DocumentAssociate.customer
                : DocumentAssociate.vehicle;

        ///get document id
        final documentType = uploadFile.destination?.split("/").last;

        final payload = {
          "id": associateId,
          "documents": {
            documentType: {
              "label": "Carte d’identité recto",
              "date": DateTime.now().formatDatePayloadFr,
              "path": uploadFile.path,
              "filename": uploadFile.filename,
            },
          }
        };

        final vihiclePayload = {
          "data": {
            "id": associateId,
            "documents": {
              documentType: {
                "label": "Carte d’identité recto",
                "date": DateTime.now().formatDatePayloadFr,
                "path": uploadFile.path,
                "filename": uploadFile.filename,
              },
            }
          }
        };

        if (documentAssociate == DocumentAssociate.customer) {
          final result = await customerUpdateUseCase(CustomerUpdateParams(
            data: payload,
            id: associateId ?? "",
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
              documentsUploadedCounter++;
              emit(AssociateDocumentsSuccessState(
                  status: Status.success,
                  message: "$associate : $documentType updated"));
            },
          );
        } else if (documentAssociate == DocumentAssociate.driver) {
          final result = await driverUpdateUseCase(DriverUpdateParams(
            data: payload,
            id: associateId ?? "",
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
              documentsUploadedCounter++;
              emit(AssociateDocumentsSuccessState(
                  status: Status.success,
                  message: "$associate : $documentType updated"));
            },
          );
        } else if (documentAssociate == DocumentAssociate.vehicle) {
          final result = await vehicleUpdateUseCase(VehicleUpdateParams(
            data: vihiclePayload,
            id: associateId ?? "",
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
              documentsUploadedCounter++;
              emit(AssociateDocumentsSuccessState(
                  status: Status.success,
                  message: "$associate : $documentType updated"));
            },
          );
        }
      }
    } catch (_) {
      emit(const ErrorState(status: Status.error, message: unknownError));
    }
  }

  void _otherDocumentType(OtherDocumentType event, Emitter emit) {
    documentPickers[documentPickers.indexOf(event.documentPicker)].type =
        event.documentItem;
    emit(BaseState(
        status: Status.success,
        message:
            "tag: ${event.documentPicker.file}${event.documentItem.type}"));
  }
}
