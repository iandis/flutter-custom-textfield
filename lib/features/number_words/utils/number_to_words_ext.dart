import 'dart:math' as math;

extension NumberToWordsExt on String {
  String get numberToWords {
    assert(int.tryParse(this) != null, 'Value must be a number.');
    return _convertNumberToDefinedWordsEN(this) ??
        _convertNumberToWordsEN(this);
  }
}

// We suffix each names with 'EN' here because the words are specific to English.

const Map<String, String> _unitWordsEN = <String, String>{
  '0': 'zero',
  '1': 'one',
  '2': 'two',
  '3': 'three',
  '4': 'four',
  '5': 'five',
  '6': 'six',
  '7': 'seven',
  '8': 'eight',
  '9': 'nine',
};

const Map<String, String> _tensWordsBelow20EN = <String, String>{
  '10': 'ten',
  '11': 'eleven',
  '12': 'twelve',
  '13': 'thirteen',
  '14': 'fourteen',
  '15': 'fifteen',
  '18': 'eighteen',
};

const Map<String, String> _tensWordsAbove20EN = <String, String>{
  '20': 'twenty',
  '30': 'thirty',
  '40': 'forty',
  '50': 'fifty',
  '80': 'eighty',
};

const Map<int, String> _digitSuffixEN = <int, String>{
  3: 'thousand',
  6: 'million',
  9: 'billion',
  12: 'trillion',
};

String? _convertNumberToDefinedWordsEN(String value) =>
    _unitWordsEN[value] ??
    _tensWordsBelow20EN[value] ??
    _tensWordsAbove20EN[value];

String _convertNumberToWordsEN(String value) {
  final int length = value.length;
  String result = '';
  int currentStart = 0;
  int currentEnd = math.min(3, length);
  while (true) {
    final String currentValueString = value.substring(
      length - currentEnd,
      length - currentStart,
    );
    final int currentValue = int.parse(currentValueString);
    String currentResult = _isUnit(currentValue)
        ? _toUnitWordEN(currentValue)
        : _isTens(currentValue)
            ? _toTensWordEN(currentValue)
            : _toHundredsWordEN(currentValue);
    if (currentStart > 0) {
      // We want to append digit suffix like thousand, million, etc
      final int digitsCount = _getDigitsCountFor(currentStart);
      currentResult = '$currentResult ${_digitSuffixEN[digitsCount]}';
    }
    result = currentStart == 0 ? currentResult : '$currentResult $result';
    if (currentEnd == length) return result;

    currentStart += 3;
    currentEnd = math.min(currentEnd + 3, length);
  }
}

/// This is used by [_convertNumberToWordsEN] to get appropriate digits count to
/// lookup in [_digitSuffixEN].
int _getDigitsCountFor(int value) {
  final int remaining = value % 3;
  return remaining == 0 ? value : value - remaining + 3;
}

// UNITS
bool _isUnit(int value) => value < 10;
String _toUnitWordEN(int value) => _unitWordsEN[value.toString()]!;

// TENS
bool _isTens(int value) => value > 9 && value < 100;
String _toTensWordEN(int value) {
  final String valueString = value.toString();
  final String? definedTensWords =
      _tensWordsBelow20EN[valueString] ?? _tensWordsAbove20EN[valueString];
  return definedTensWords ??
      (value < 20
          ? _toTensWordsBelow20EN(value)
          : _toTensWordsAbove20EN(value));
}

String _toTensWordsBelow20EN(int value) {
  final String unitWord = _toUnitWordEN(value - 10);
  return '${unitWord}teen';
}

String _toTensWordsAbove20EN(int value) {
  final int tens = value ~/ 10;
  final String tensString = (tens * 10).toString();
  final String tensWord =
      _tensWordsAbove20EN[tensString] ?? '${_toUnitWordEN(tens)}ty';
  final int unit = value - tens * 10;
  if (unit == 0) {
    return tensWord;
  }
  final String unitWord = _toUnitWordEN(unit);
  return '$tensWord-$unitWord';
}

// HUNDREDS
String _toHundredsWordEN(int value) {
  final int hundreds = value ~/ 100;
  final String hundredsWord = '${_toUnitWordEN(hundreds)} hundred';
  final int remaining = value - hundreds * 100;
  if (remaining == 0) {
    return hundredsWord;
  }
  if (_isUnit(remaining)) {
    final String unitWord = _toUnitWordEN(remaining);
    return '$hundredsWord $unitWord';
  }
  assert(remaining > 9);
  return '$hundredsWord ${_toTensWordEN(remaining)}';
}
