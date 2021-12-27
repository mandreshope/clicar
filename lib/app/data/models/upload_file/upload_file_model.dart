import 'package:clicar/app/domain/entities/upload_file/upload_file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_file_model.g.dart';

@JsonSerializable()
class UploadFileModel extends UploadFile {
  final String? fieldname;
  final String? originalname;
  final String? encoding;
  final String? mimetype;
  final String? destination;
  final String? filename;
  final String? path;
  final int? size;

  const UploadFileModel({
    this.fieldname,
    this.originalname,
    this.encoding,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
  }) : super(
          fieldname: fieldname,
          originalname: originalname,
          encoding: encoding,
          mimetype: mimetype,
          destination: destination,
          filename: filename,
          path: path,
          size: size,
        );

  factory UploadFileModel.fromJson(Map<String, dynamic> json) =>
      _$UploadFileModelFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileModelToJson(this);
}
