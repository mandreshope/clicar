import 'package:flutter/material.dart';

class OptionFilterCard extends StatelessWidget {
  const OptionFilterCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text("Jour")),
              ElevatedButton(onPressed: () {}, child: const Text("SEMAINE")),
              ElevatedButton(onPressed: () {}, child: const Text("MOIS")),
              ElevatedButton(onPressed: () {}, child: const Text("DATE")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.calendar_today), labelText: "Mois"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
              },
            ),
          ),
        ],
      ),
    );
  }
}
