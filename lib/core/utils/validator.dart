import 'package:clicar/core/utils/extension.dart';

abstract class Validator {
  static String? email(String? value) {
    if (value == null) {
      return 'Veuillez saisir votre email';
    } else if (value.isValidateEmail == false) {
      return 'Veuillez saisir email valide';
    }
    return null;
  }
}
