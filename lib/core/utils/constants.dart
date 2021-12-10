import 'package:flutter/cupertino.dart';

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

/// server config
const String baseUrl = "https://api-new.clicar.fr";

/// endpoint
const String loginEndpoint = "/auth/login";
const String registerEndpoint = "/user";
