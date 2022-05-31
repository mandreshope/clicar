import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_tile.dart';
import 'package:flutter/material.dart';

class ReservationtDetailCard extends StatelessWidget {
  final String? reservation;
  final String? intutile;
  final String? vehicle;
  final String? typeLocation;
  final String? departureDate;
  final String? returnDate;
  final String? immat;
  const ReservationtDetailCard({
    Key? key,
    this.reservation,
    this.intutile,
    this.vehicle,
    this.typeLocation,
    this.departureDate,
    this.returnDate,
    this.immat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContractDetailTile(
          label: "Réservation : ",
          value: reservation ?? "-",
          fontWeight: FontWeight.bold,
        ),
        ContractDetailTile(
          label: "Intutilé : ",
          value: intutile ?? "-",
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: CustomTheme.spacer,
        ),
        ContractDetailTile(
          label: "Véhicule : ",
          value: vehicle ?? "-",
          valueTextColor: Colors.grey,
        ),
        if (immat != null) ...[
          ContractDetailTile(
            label: "Immat : ",
            value: immat ?? "-",
            valueTextColor: Colors.grey,
          ),
        ],
        ContractDetailTile(
          label: "Type de location : ",
          value: typeLocation ?? "-",
          valueTextColor: Colors.grey,
        ),
        const SizedBox(
          height: CustomTheme.spacer,
        ),
        ContractDetailTile(
          label: "Départ : ",
          value: departureDate != null
              ? DateTime.parse(departureDate!).formatDateyMd
              : "-",
          valueTextColor: Colors.grey,
        ),
        ContractDetailTile(
          label: "Retour prévu : ",
          value: returnDate != null
              ? DateTime.parse(returnDate!).formatDateyMd
              : "-",
          valueTextColor: Colors.grey,
        ),
      ],
    );
  }
}
