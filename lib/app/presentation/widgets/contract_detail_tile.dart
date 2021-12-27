import 'package:clicar/app/core/utils/extension.dart';
import 'package:clicar/app/core/utils/theme.dart';
import 'package:flutter/material.dart';

class ContractDetailTile extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueTextColor;
  final FontWeight? fontWeight;
  const ContractDetailTile({
    required this.label,
    required this.value,
    this.fontWeight,
    Key? key,
    this.valueTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: CustomTheme.subtitle2.sp(context),
            color: CustomTheme.primaryColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: CustomTheme.subtitle2.sp(context),
            color: valueTextColor ?? CustomTheme.primaryColor,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
