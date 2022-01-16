import 'package:clicar/app/core/utils/currency_formatter.dart';
import 'package:clicar/app/core/utils/integer_formatter.dart';
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

final CustomTextInputFormatter formatterDecimal = CustomTextInputFormatter(
  separator: " ",
  decimalSeparator: ",",
);
final IntegerTextInputFormatter formatterInteger = IntegerTextInputFormatter(
  separator: " ",
);

/// sharedPref keys
const String cachedToken = "CACHED_TOKEN";

/// assets
const assetsImages = "assets/images/";

const signatureServerFilePath = "/uploadFile/file/signatures/";
const userPhotoServerFilePath = "/uploadFile/file/profiles/";
const edlServerFilePath = "/uploadFile/file/edl/";

/// message
const String tokenExpiredMessage =
    "Votre session a expiré. Veuillez vous reconnecter";

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}
