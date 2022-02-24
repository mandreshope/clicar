import 'dart:io';

import 'package:clicar/app/core/utils/constants.dart';
import 'package:clicar/app/core/utils/extension.dart';
import 'package:flutter/material.dart';

class PhotoSizeMax extends StatelessWidget {
  final File? file;
  const PhotoSizeMax({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.w(context),
        height: 10.h(context),
        color: Colors.black.withOpacity(0.6),
        child: const Center(
          child: Text(
            // "${fileSize(file)} Mo Cette photo depasse la taille de fichier maximale pour le téléversement",
            "Cette photo depasse la taille de fichier maximale pour le téléversement",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
