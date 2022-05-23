import 'package:clicar/app/core/utils/theme.dart';
import 'package:flutter/material.dart';

class ItemAmountCard extends StatelessWidget {
  final String title;
  final String amount;
  final double? percentage;
  const ItemAmountCard({
    Key? key,
    required this.title,
    required this.amount,
    this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: const Color(0xFF8f94b2),
                  fontSize: CustomTheme.headline1,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "€ $amount",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: CustomTheme.headline3,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (percentage != null)
                Row(
                  children: [
                    Text(
                      "$percentage %",
                      style: const TextStyle(color: Colors.red),
                    ),
                    const Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Mois Dernier")
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
