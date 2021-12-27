import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

/// debug tools
String get logTrace =>
    '[LOG_TRACE] ' +
    StackTrace.current.toString().split("\n").toList()[1].split("      ").last;
String get firstCurrentStackTrace => StackTrace.current
    .toString()
    .split("\n")
    .toList()[1]
    .split("      ")
    .last
    .split(" ")
    .first
    .toString();

/// navigator
Object? navigatorArgs(BuildContext context) {
  return ModalRoute.of(context)!.settings.arguments;
}

/// sharedPref keys
const String cachedToken = "CACHED_TOKEN";

/// assets
const assetsImages = "assets/images/";

/// message
const String tokenExpiredMessage =
    "Votre session a expiré. Veuillez vous reconnecter";

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
