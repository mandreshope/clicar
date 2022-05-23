import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/domain/entities/bdc/bdc.dart';
import 'package:flutter/material.dart';

class SearchBdcResult extends StatelessWidget {
  final Bdc bdc;
  final VoidCallback? onTap;
  const SearchBdcResult({
    required this.bdc,
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bdc.numberContrat ?? '-',
              style: TextStyle(
                  fontSize: CustomTheme.subtitle2.sp(context),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bdc.customer!.lastName ?? '',
              style: TextStyle(
                  fontSize: CustomTheme.subtitle2.sp(context),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              bdc.info?.departureDate != null
                  ? "EDL prévu le ${DateTime.parse(bdc.info!.departureDate!).formatDateyMd}"
                  : "-",
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
