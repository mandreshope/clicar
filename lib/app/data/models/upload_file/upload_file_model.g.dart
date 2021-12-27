// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadFileModel _$UploadFileModelFromJson(Map<String, dynamic> json) =>
    UploadFileModel(
      fieldname: json['fieldname'] as String?,
      originalname: json['originalname'] as String?,
      encoding: json['encoding'] as String?,
      mimetype: json['mimetype'] as String?,
      destination: json['destination'] as String?,
      filename: json['filename'] as String?,
      path: json['path'] as String?,
      size: json['size'] as int?,
    );

Map<String, dynamic> _$UploadFileModelToJson(UploadFileModel instance) =>
    <String, dynamic>{
      'fieldname': instance.fieldname,
      'originalname': instance.originalname,
      'encoding': instance.encoding,
      'mimetype': instance.mimetype,
      'destination': instance.destination,
      'filename': instance.filename,
      'path': instance.path,
      'size': instance.size,
    };
