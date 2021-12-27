import 'package:equatable/equatable.dart';

class UploadFile extends Equatable {
  final String? fieldname;
  final String? originalname;
  final String? encoding;
  final String? mimetype;
  final String? destination;
  final String? filename;
  final String? path;
  final int? size;

  const UploadFile({
    this.fieldname,
    this.originalname,
    this.encoding,
    this.mimetype,
    this.destination,
    this.filename,
    this.path,
    this.size,
  });

  @override
  List<Object?> get props => [
        fieldname,
        originalname,
        encoding,
        mimetype,
        destination,
        filename,
        path,
        size,
      ];
}
