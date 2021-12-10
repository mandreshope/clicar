import 'package:flutter/material.dart';

class SnackBarWidget {
  static show({
    required BuildContext context,
    required String message,
  }) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
    });
  }
}
