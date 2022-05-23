import 'package:flutter/material.dart';

class ItemStatCard extends StatelessWidget {
  final Widget trailing;
  final Color color;
  final String info;
  const ItemStatCard(
      {Key? key,
      required this.trailing,
      required this.color,
      required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 25,
                height: 25,
                color: color,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(info),
            ],
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topRight,
              child: trailing
            )
          )
        ],
      ),
    );
  }
}
