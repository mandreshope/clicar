import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/errors/failures.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
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

  List<DocumentPicker> documentPickers = [];

  List<UploadFile> documentsUploaded = [];

  int documentsUploadedCounter = 0;

  List<DocumentItem> types = [
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
    DocumentItem(type: "Other", label: "Other")
  ];

  List<DocumentItem> associates = [
    DocumentItem(type: "Conducteur", label: "Conducteur"),
    DocumentItem(type: "Client", label: "Client"),
    DocumentItem(type: "Vehicule", label: "Véhicule"),
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
  }

  void reset() {
    documentPickers.clear();
    documentsUploaded.clear();
    documentsUploadedCounter = 0;
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
    emit(BaseState(
        status: Status.success,
        message:
            "tag: ${event.documentPicker.file}${event.documentItem.type}"));
  }

  void _selectAssociatedDocumentEvent(
      SelectAssociatedDocumentEvent event, Emitter emit) {
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
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }

  Future<void> _searchAssociateEvent(
      SearchAssociateEvent event, Emitter emit) async {
    emit(const BaseState(status: Status.loading, message: 'loading ⌛'));
    try {
      if (event.documentAssociate == DocumentAssociate.customer) {
        final result = await searchCustomerUseCase(SearchCustomerParams(
          filter: event.keyWord,
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
      } else if (event.documentAssociate == DocumentAssociate.driver) {
        final result = await searchDriverUseCase(SearchDriverParams(
          filter: event.keyWord,
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
      } else if (event.documentAssociate == DocumentAssociate.vehicle) {
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
      }
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
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
              "date": DateTime.now().formatDatePayload,
              "path": uploadFile.path,
              "filename": uploadFile.filename,
            },
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
                    status: Status.error, message: 'No connextion error'));
              } else if (failure is ServerFailure) {
                emit(
                    ErrorState(status: Status.error, message: failure.message));
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
                    status: Status.error, message: 'No connextion error'));
              } else if (failure is ServerFailure) {
                emit(
                    ErrorState(status: Status.error, message: failure.message));
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
              documentsUploadedCounter++;
              emit(AssociateDocumentsSuccessState(
                  status: Status.success,
                  message: "$associate : $documentType updated"));
            },
          );
        } else if (documentAssociate == DocumentAssociate.vehicle) {
          final result = await vehicleUpdateUseCase(VehicleUpdateParams(
            data: payload,
            id: associateId ?? "",
          ));
          result.fold(
            (failure) {
              if (failure is NoConnectionFailure) {
                emit(const ErrorState(
                    status: Status.error, message: 'No connextion error'));
              } else if (failure is ServerFailure) {
                emit(
                    ErrorState(status: Status.error, message: failure.message));
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
              documentsUploadedCounter++;
              emit(AssociateDocumentsSuccessState(
                  status: Status.success,
                  message: "$associate : $documentType updated"));
            },
          );
        }
      }
    } catch (_) {
      emit(ErrorState(status: Status.error, message: _.toString()));
    }
  }
}
