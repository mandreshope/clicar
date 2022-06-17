import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/presentation/widgets/contract_detail_tile.dart';
import 'package:flutter/material.dart';

class BdcDetailCard extends StatelessWidget {
  final String? bdc;
  final String? typeLocation;
  final String? departureDate;
  final String? returnDate;
  final String? vehicle;
  final String? intutile;
  const BdcDetailCard({
    Key? key,
    this.bdc,
    this.typeLocation,
    this.departureDate,
    this.returnDate,
    this.vehicle,
    this.intutile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContractDetailTile(
          label: "Bon de commande : ",
          value: bdc ?? "-",
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
