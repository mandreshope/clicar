import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class OptionFilterCard extends StatefulWidget {
  OptionFilterCard({Key? key, required this.filterWithDay}) : super(key: key);
  Function filterWithDay;
  @override
  State<OptionFilterCard> createState() => _OptionFilterCardState();
}

class _OptionFilterCardState extends State<OptionFilterCard> {
  FilterDate? filterType;
  String? dateBegin;
  String? dateEnd;
  String? week;
  String? month;
  String? day;
  DateTime _selectedDate = DateTime.now();
  DateTime _selectedDateMonth = DateTime.now();
  DatePeriod? _selectedPeriod;
  TextEditingController? dayController;
  TextEditingController? beginDateController;
  TextEditingController? endDateController;
  Map<String, dynamic>? data;
  void manageData({required String filter}) {
    data = {
      "filter": filter,
      "month": month,
      "filtreRangeBegin": dateBegin,
      "filtreRangeEnd": dateEnd,
      "day": day,
      "week": week,
    };
  }

  void _onChangedWeek(DatePeriod newPeriod) {
    setState(() {
      int tempWeek = Jiffy(newPeriod.start).week;
      int tempYear = Jiffy(newPeriod.start).year;
      if (tempWeek < 10) {
        week = "$tempYear-W0$tempWeek";
      } else {
        week = "$tempYear-W$tempWeek";
      }
      _selectedDate = newPeriod.start;
      _selectedPeriod = newPeriod;
      manageData(filter: "week");
      widget.filterWithDay(data);
    });
  }

  void _onChangedMonth(DateTime newDate) {
    setState(() {
      month = DateFormat('yyyy-MM').format(newDate).toString();
      debugPrint(month);
      _selectedDateMonth = newDate;
      manageData(filter: 'month');
      widget.filterWithDay(data);
    });
  }

  @override
  void initState() {
    dayController =
        TextEditingController(text: DateTime.now().toString().split(' ')[0]);
    beginDateController =
        TextEditingController(text: DateTime.now().toString().split(' ')[0]);
    endDateController = TextEditingController(
        text: Jiffy().add(months: 1).dateTime.toString().split(' ')[0]);
    filterType = FilterDate.day;
    dateBegin = beginDateController!.text;
    dateEnd = endDateController!.text;
    day = DateTime.now().toString().split(" ")[0];
    month = DateFormat('yyyy-MM').format(DateTime.now()).toString();
    int tempWeek = Jiffy(DateTime.now()).week;
    int tempYear = Jiffy(DateTime.now()).year;
    if (tempWeek < 10) {
      week = "$tempYear-W0$tempWeek";
    } else {
      week = "$tempYear-W$tempWeek";
    }
    manageData(filter: 'day');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: filterType == FilterDate.day
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      filterType = FilterDate.day;
                      widget.filterWithDay(data);
                    });
                  },
                  child: Text(
                    "JOUR",
                    style: TextStyle(
                        color: filterType == FilterDate.day
                            ? Theme.of(context).primaryColor
                            : Colors.white),
                  ),
                ),
                MaterialButton(
                  color: filterType == FilterDate.week
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      filterType = FilterDate.week;
                      widget.filterWithDay(data);
                    });
                  },
                  child: Text(
                    "SEMAINE",
                    style: TextStyle(
                        color: filterType == FilterDate.week
                            ? Theme.of(context).primaryColor
                            : Colors.white),
                  ),
                ),
                MaterialButton(
                  color: filterType == FilterDate.month
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      filterType = FilterDate.month;
                      widget.filterWithDay(data);
                    });
                  },
                  child: Text(
                    "Mois",
                    style: TextStyle(
                      color: filterType == FilterDate.month
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
                MaterialButton(
                  color: filterType == FilterDate.date
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(
                      () {
                        filterType = FilterDate.date;
                        widget.filterWithDay(data);
                      },
                    );
                  },
                  child: Text(
                    "DATE",
                    style: TextStyle(
                      color: filterType == FilterDate.date
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (filterType == FilterDate.day)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: dayController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today)),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    // initialEntryMode: DatePickerEntryMode.input,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    dayController!.text = pickedDate.toString().split(' ')[0];
                    //Todo callback filter date
                    day = dayController!.text;
                    manageData(filter: 'day');
                    widget.filterWithDay(data);
                  }
                },
              ),
            )
          else if (filterType == FilterDate.month)
            MonthPicker.single(
              selectedDate: _selectedDateMonth,
              onChanged: _onChangedMonth,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            )
          else if (filterType == FilterDate.week)
            WeekPicker(
              selectedDate: _selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
              onChanged: _onChangedWeek,
            )
          else if (filterType == FilterDate.date) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: beginDateController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today)),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    beginDateController!.text =
                        pickedDate.toString().split(' ')[0];
                    //Todo callback filter date
                    dateBegin = beginDateController!.text;
                    manageData(filter: 'date');
                    widget.filterWithDay(data);
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: endDateController,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.calendar_today)),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: Jiffy().add(months: 1).dateTime,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    endDateController!.text =
                        pickedDate.toString().split(' ')[0];
                    //Todo callback filter date
                    dateEnd = endDateController!.text;
                    manageData(filter: 'date');
                    widget.filterWithDay(data);
                  }
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

enum FilterDate {
  day,
  week,
  month,
  date,
}
