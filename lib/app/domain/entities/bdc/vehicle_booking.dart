import 'package:equatable/equatable.dart';

class VehicleBooking extends Equatable {
  final String? markAndTypeAutre;
  final String? markAndType;
  final String? gearBox;
  final List<String>? options;
  final String? motor;
  final String? end;
  final String? foil;
  final String? divers;
  final dynamic kmSupplementaire;
  const VehicleBooking(
      {this.markAndTypeAutre,
      this.markAndType,
      this.gearBox,
      this.options,
      this.motor,
      this.end,
      this.foil,
      this.divers,
      this.kmSupplementaire});

  @override
  List<Object?> get props => [
        markAndTypeAutre,
        markAndType,
        gearBox,
        options,
        motor,
        end,
        foil,
        divers,
        kmSupplementaire
      ];
}
