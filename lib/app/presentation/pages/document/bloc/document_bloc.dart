import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/core/states/error_state.dart';
import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_multi_file_usecase.dart';
import 'package:clicar/app/domain/usecases/upload_file/upload_single_file_usecase.dart';
import 'package:clicar/app/presentation/pages/document/enums/document_associate.dart';
import 'package:clicar/app/presentation/pages/document/types/document_item.dart';
import 'package:clicar/app/presentation/pages/document/types/document_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:rxdart/rxdart.dart';

part 'document_event.dart';
part 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, BaseState> {
  final UploadMultiFileUseCase uploadMultiFileUseCase;
  final UploadSingleFileUseCase uploadSingleFileUseCase;

  List<DocumentPicker> documentPickers = [];

  List<UploadFile> documentsUploaded = [];

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

  List<Map> client = [
    {
      "name": "Randrianirina Nambinina Rivo",
      "id": "61d8430351a2bd0021c0d96e",
    }
  ];

  List<Map> conducteur = [
    {
      "name": "YETE THOMAS",
      "id": "611ffd821f0a540135700268",
    },
    {
      "name": "CO D",
      "id": "611ffd821f0a540135700268",
    }
  ];

  List<Map> vehicle = [
    {
      "name": "AY-819-PX",
      "id": "611ffd781f0a5401356fff17",
    }
  ];

  DocumentBloc({
    required this.uploadMultiFileUseCase,
    required this.uploadSingleFileUseCase,
  }) : super(const BaseState(status: Status.initial, message: "initial")) {
    on<AddDocumentPickerEvent>(_addDocumentPickerEvent);
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

  void _addDocumentPickerEvent(AddDocumentPickerEvent event, Emitter emit) {
    documentPickers.add(DocumentPicker(file: event.file));
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
            dir, "${item.associated!.type}-${item.associated!.id}.jpg");
        debugPrint('NewPath: $newPath');
        final upload = await uploadSingleFileUseCase(
          UploadSingleFileParams(
            file: item.file.renameSync(newPath),
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
            documentsUploaded.add(success);
            emit(const UploadDocumentsSuccessState(
              status: Status.loading,
              message: "upload file success",
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
    List<DocumentItem> result = [];
    if (event.documentAssociate == DocumentAssociate.customer) {
      final customer = client.map(
          (e) => DocumentItem(type: "Client", label: e["name"], id: e["id"]));
      result = customer
          .where((e) => e.label
              .toLowerCase()
              .contains(event.keyWord.toLowerCase().trim()))
          .toList();
    } else if (event.documentAssociate == DocumentAssociate.driver) {
      final driver = conducteur.map((e) =>
          DocumentItem(type: "Conducteur", label: e["name"], id: e["id"]));
      result = driver
          .where((e) => e.label
              .toLowerCase()
              .contains(event.keyWord.toLowerCase().trim()))
          .toList();
    } else if (event.documentAssociate == DocumentAssociate.vehicle) {
      final vehicule = vehicle.map(
          (e) => DocumentItem(type: "Vehicule", label: e["name"], id: e["id"]));
      result = vehicule
          .where((e) => e.label
              .toLowerCase()
              .contains(event.keyWord.toLowerCase().trim()))
          .toList();
    }

    await Future.delayed(const Duration(seconds: 1));
    emit(
      SearchAssociateSuccessState(
          result: result,
          status: Status.success,
          message: 'update ${event.keyWord} ${event.documentAssociate}'),
    );
  }

  Future<void> _associateDocumentsEvent(event, Emitter emit) async {}
}
