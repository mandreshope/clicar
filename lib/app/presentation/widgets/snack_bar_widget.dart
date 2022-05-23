import 'package:flutter/material.dart';

class SnackBarWidget {
  static show({
    required BuildContext context,
    required String message,
    required bool isError,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor:
                isError ? Theme.of(context).errorColor : Colors.green[800],
            content: Text(message),
          ),
        );
    });
  }
}
