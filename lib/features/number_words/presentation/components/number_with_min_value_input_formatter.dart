import 'package:flutter/services.dart';

class NumberWithMinValueInputFormatter implements TextInputFormatter {
  const NumberWithMinValueInputFormatter([this.minimumValue = 0]);

  final int minimumValue;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int? newValueInt = int.tryParse(newValue.text);

    if (newValueInt == null || newValueInt < minimumValue) {
      final String minimumValueString = minimumValue.toString();
      final TextEditingValue nextValue = newValue.copyWith(
        text: minimumValueString,
        selection: TextSelection.fromPosition(
          TextPosition(offset: minimumValueString.length),
        ),
      );
      return nextValue;
    }

    if (newValue.text.startsWith('0')) {
      final String newValueText = newValue.text.substring(1);
      return newValue.copyWith(
        text: newValueText,
        selection: TextSelection.fromPosition(
          TextPosition(offset: newValueText.length),
        ),
      );
    }

    return newValue;
  }
}
