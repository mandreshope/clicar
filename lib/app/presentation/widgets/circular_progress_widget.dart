import 'package:clicar/app/core/utils/theme.dart';
import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final Color? color;
  final double? size;
  final double? strokeWidth;
  final double? value;
  const CircularProgress({
    Key? key,
    this.color,
    this.strokeWidth,
    this.size,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size ?? 20,
        height: size ?? 20,
        child: CircularProgressIndicator(
          value: value,
          strokeWidth: strokeWidth ?? 4.0,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? CustomTheme.primaryColor,
          ),
        ),
      ),
    );
  }
}
