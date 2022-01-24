import 'package:clicar/app/core/utils/extension.dart';
import 'package:flutter/material.dart';

class PhotoSizeMax extends StatelessWidget {
  const PhotoSizeMax({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50.w(context),
        height: 10.h(context),
        color: Colors.black.withOpacity(0.6),
        child: const Center(
          child: Text(
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
