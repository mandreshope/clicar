import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/domain/entities/contract/contract.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';

class SearchContractResult extends StatelessWidget {
  final Contract contract;
  const SearchContractResult({required this.contract, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.signatureSummary);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contract.numberContrat ?? '-',
              style: TextStyle(
                  fontSize: CustomTheme.subtitle2.sp(context),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              contract.driver?.address ?? '',
              style: TextStyle(
                  fontSize: CustomTheme.subtitle2.sp(context),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              contract.vehicle?.mark ?? "",
              style: TextStyle(
                fontSize: CustomTheme.subtitle2.sp(context),
                color: Colors.grey,
              ),
            ),
            Text(
              contract.vehicle?.immat1 ?? "",
              style: TextStyle(
                fontSize: CustomTheme.subtitle2.sp(context),
                color: Colors.grey,
              ),
            ),
            Text(
              contract.info?.departureDate ?? "",
              style: TextStyle(
                fontSize: CustomTheme.subtitle2.sp(context),
                fontWeight: FontWeight.bold,
                color: CustomTheme.secondaryColor,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
