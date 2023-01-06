part of 'text_validation_bloc.dart';

@freezedBlocEvent
class TextValidationEvent with _$TextValidationEvent {
  factory TextValidationEvent.inputChanged(String value) = _InputChanged;
  factory TextValidationEvent.validationCleared() = _ValidationCleared;
  factory TextValidationEvent.submitted() = _Submitted;
}
