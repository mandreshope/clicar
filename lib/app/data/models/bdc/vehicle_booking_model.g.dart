// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleBookingModel _$VehicleBookingModelFromJson(Map<String, dynamic> json) =>
    VehicleBookingModel(
      markAndTypeAutre: json['markAndTypeAutre'] as String?,
      markAndType: json['markAndType'] as String?,
      gearBox: json['gearBox'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      motor: json['motor'] as String?,
      end: json['end'] as String?,
      foil: json['foil'] as String?,
      divers: json['Divers'] as String?,
      kmSupplementaire: json['kmSupplementaire'],
    );

Map<String, dynamic> _$VehicleBookingModelToJson(
        VehicleBookingModel instance) =>
    <String, dynamic>{
      'markAndTypeAutre': instance.markAndTypeAutre,
      'markAndType': instance.markAndType,
      'gearBox': instance.gearBox,
      'options': instance.options,
      'motor': instance.motor,
      'end': instance.end,
      'foil': instance.foil,
      'Divers': instance.divers,
      'kmSupplementaire': instance.kmSupplementaire,
    };
