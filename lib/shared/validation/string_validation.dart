final RegExp _lettersOnlyRegExp = RegExp(r'^[A-Z a-z]+$');

enum IsValid {
  valid,
  empty,
  tooShort,
  tooLong,
  invalid,
}

extension IsValidBool on IsValid {
  bool get isTrue => this == IsValid.valid;
}

typedef StringValidatorCallback = IsValid Function(String? value);

class StringValidation {
  StringValidation();

  final List<StringValidatorCallback> _validators = <StringValidatorCallback>[];

  void add(StringValidatorCallback callback) {
    _validators.add(callback);
  }

  StringValidation minLength(int min) {
    add((String? value) => _minLength(value, min));
    return this;
  }

  StringValidation maxLength(int max) {
    add((String? value) => _maxLength(value, max));
    return this;
  }

  StringValidation get isLettersOnly {
    assert(
      !_validators.contains(_isLettersOnly),
      'LettersOnly validator already exists.',
    );
    add(_isLettersOnly);
    return this;
  }

  /// Validate [value] with previously added validator callbacks
  IsValid test(String? value) {
    IsValid isValid = IsValid.valid;
    assert(_validators.isNotEmpty, 'Validator callback cannot be empty.');
    for (StringValidatorCallback callback in _validators) {
      isValid = callback(value);
      if (isValid != IsValid.valid) break;
    }
    return isValid;
  }
}

IsValid _minLength(String? value, int min) {
  if (value == null || value.isEmpty) return IsValid.empty;
  if (value.length < min) return IsValid.tooShort;
  return IsValid.valid;
}

IsValid _maxLength(String? value, int max) {
  if (value == null || value.isEmpty) return IsValid.empty;
  if (value.length > max) return IsValid.tooLong;
  return IsValid.valid;
}

IsValid _isLettersOnly(String? value) {
  if (value == null || value.isEmpty) return IsValid.empty;
  if (!_lettersOnlyRegExp.hasMatch(value)) return IsValid.invalid;
  return IsValid.valid;
}
