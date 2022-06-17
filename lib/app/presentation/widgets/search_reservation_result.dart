import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:clicar/app/domain/entities/reservation/reservation.dart';
import 'package:flutter/material.dart';

class SearchReservationResult extends StatelessWidget {
  final Reservation reservation;
  final VoidCallback? onTap;
  const SearchReservationResult({
    required this.reservation,
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
              "Réservation № ${reservation.numberReservation ?? '-'}",
              style: TextStyle(
                  fontSize: CustomTheme.subtitle2.sp(context),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              reservation.customer?.firstName ?? '',
              style: TextStyle(
                  fontSize: CustomTheme.subtitle2.sp(context),
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              reservation.vehicule?.mark ?? "",
              style: TextStyle(
                fontSize: CustomTheme.subtitle2.sp(context),
                color: Colors.grey,
              ),
            ),
            Text(
              reservation.vehicule?.immat1 ?? "",
              style: TextStyle(
                fontSize: CustomTheme.subtitle2.sp(context),
                color: Colors.grey,
              ),
            ),
            Text(
              reservation.info?.departureDate != null
                  ? "EDL prévu le ${DateTime.parse(reservation.info!.departureDate!).formatDateyMd}"
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
