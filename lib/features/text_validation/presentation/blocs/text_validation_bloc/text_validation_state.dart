part of 'text_validation_bloc.dart';

const KeyedValue<IsValid> _defaultIsValid = KeyedValue<IsValid>(
  key: null,
  value: IsValid.valid,
);

@freezed
class TextValidationState with _$TextValidationState {
  const factory TextValidationState({
    @Default('') String input,
    @Default(_defaultIsValid) KeyedValue<IsValid> isValid,
  }) = _TextValidationState;

  static const TextValidationState empty = TextValidationState();
}
