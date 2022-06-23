import 'package:clicar/app/core/states/base_state.dart';
import 'package:clicar/app/domain/entities/statistique/vehicle_stat/vehicle_stat.dart';
import 'package:clicar/app/presentation/pages/statistique/bloc/stat_bloc.dart';
import 'package:clicar/app/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class ItemListVehicle extends StatefulWidget {
  final VehicleStat statVehicle;
  const ItemListVehicle({Key? key, required this.statVehicle})
      : super(key: key);

  @override
  State<ItemListVehicle> createState() => _ItemListVehicleState();
}

class _ItemListVehicleState extends State<ItemListVehicle> {
  Map<String, dynamic>? data;
  String? dateBegin;
  String? dateEnd;
  String? week;
  String? month;
  String? day;

  @override
  void initState() {
    dateBegin = DateTime.now().toString().split(' ')[0];
    dateEnd = Jiffy().add(months: 1).dateTime.toString().split(' ')[0];
    day = DateTime.now().toString().split(" ")[0];
    month = DateFormat('yyyy-MM').format(DateTime.now()).toString();
    int tempWeek = Jiffy(DateTime.now()).week;
    int tempYear = Jiffy(DateTime.now()).year;
    if (tempWeek < 10) {
      week = "$tempYear-W0$tempWeek";
    } else {
      week = "$tempYear-W$tempWeek";
    }
    data = {
      "filter": "day",
      "month": month,
      "filtreRangeBegin": dateBegin,
      "filtreRangeEnd": dateEnd,
      "day": day,
      "week": week,
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color(0xFF949292),
          child: Row(
            children: [
              const Icon(
                Icons.drive_eta,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.statVehicle.id ?? "-",
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
        if (widget.statVehicle.vehicles!.isNotEmpty)
          ...widget.statVehicle.vehicles!.map((e) {
            return BlocBuilder<StatBloc, BaseState>(builder: (context, state) {
              return InkWell(
                onTap: () {
                  //Todo get stat vehicle
                  debugPrint("get stat vehicle data");
                  data!["idVehicle"] = e.id;
                  context.read<StatBloc>().add(GetVehicleStatEvent(data: data!));
                  Navigator.pushNamed(context, AppRoutes.vehicleStat);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.immat1 ?? "-"),
                      Text(e.modele ?? "-"),
                    ],
                  ),
                ),
              );
            });
          })
      ],
    );
  }
}
