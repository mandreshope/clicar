import 'package:clicar/app/domain/entities/bdc/vehicle_booking.dart';
import 'package:json_annotation/json_annotation.dart';


part 'vehicle_booking_model.g.dart';


@JsonSerializable(explicitToJson: true)
class VehicleBookingModel extends VehicleBooking {
  final String? markAndTypeAutre;
  final String? markAndType;
  final String? gearBox;
  final List<String>? options;
  final String? motor;
  final String? end;
  final String? foil;
  @JsonKey(name: 'Divers')
  final String? divers;
  final dynamic kmSupplementaire;

  const VehicleBookingModel({
    this.markAndTypeAutre,
    this.markAndType,
    this.gearBox,
    this.options,
    this.motor,
    this.end,
    this.foil,
    this.divers,
    this.kmSupplementaire,
  }) : super(
          markAndTypeAutre: markAndTypeAutre,
          markAndType: markAndType,
          gearBox: gearBox,
          options: options,
          motor: motor,
          end: end,
          foil: foil,
          divers: divers,
          kmSupplementaire: kmSupplementaire,
        );
  factory VehicleBookingModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleBookingModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleBookingModelToJson(this);
}
