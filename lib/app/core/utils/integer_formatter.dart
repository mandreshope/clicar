import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IntegerTextInputFormatter extends TextInputFormatter {
  IntegerTextInputFormatter({
    required this.separator,
  });
  static List<String> nums = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];

  String get logId => runtimeType.toString();

  final String separator;

  ///
  /// Parse the masked String value back to double
  /// For example if sep = " "
  /// - "5 900" becomes 5900
  /// - "5 900" becomes null
  /// - "5,900" becomes null
  /// - "asdf560" becomes null
  int? parse(String currentValue) {
    String numStr = currentValue.replaceAll(separator, '');
    return int.tryParse(numStr);
  }

  ///  Take double for formatting
  String? applyMask(int number) {
    final newValueText = number.toString();
    return _applyMask(newValueText);
  }

  /// When this returns null, it means that nothing has changed
  String? _applyMaskInternal(String newValueText) {
    if (!_isValidInput(newValueText)) return null;

    String replacement = newValueText.replaceAll(separator, '');
    return _applyMask(replacement);
  }

  /// Take String partially formatted with
  /// decimal and thousand separator
  /// strictly equal to the library setup,
  /// this will output undefined behaviour
  String? _applyMask(String text) {
    List<String> integerChars = text.split('');

    if (integerChars.length == 0) {
      integerChars = ["0"];
    }

    String newString = '';
    // print("$logId $integerChars");
    for (int i = integerChars.length - 1; i >= 0; i--) {
      if ((integerChars.length - 1 - i) % 3 == 0 &&
          i < integerChars.length - 1 &&
          integerChars.length > 3) newString = separator + newString;
      newString = integerChars[i] + newString;
//        print("$logId $newString");
    }
    return newString;
  }

  bool _isValidInput(String stringTypedByUser) {
    for (final s in stringTypedByUser.split("")) {
      if (!nums.contains(s) && ![separator].contains(s)) {
        return false;
      }
    }
    return true;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // print('$logId formatEditUpdate');
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (oldValue == newValue) {
      // print('$logId new value equal old value');
      return oldValue;
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final newString = _applyMaskInternal(newValue.text);
      if (newString == null) {
        return oldValue;
      }

      // print("$logId offset $offset $newString");
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
          offset: newString.length,
        ),
      );
    } else {
      return newValue;
    }
  }
}
