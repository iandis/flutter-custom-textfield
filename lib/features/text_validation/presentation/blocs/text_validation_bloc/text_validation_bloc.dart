import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_textfield/shared/entities/keyed_value.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_custom_textfield/shared/annotations/freezed_bloc_event.dart';
import 'package:flutter_custom_textfield/shared/validation/string_validation.dart';

part 'text_validation_bloc.freezed.dart';
part 'text_validation_event.dart';
part 'text_validation_state.dart';

class TextValidationBloc
    extends Bloc<TextValidationEvent, TextValidationState> {
  TextValidationBloc() : super(TextValidationState.empty) {
    on<_InputChanged>(_onInputChanged);
    on<_ValidationCleared>(_onValidationCleared);
    on<_Submitted>(_onSubmitted);
  }

  final StringValidation _inputValidation =
      StringValidation().isLettersOnly.minLength(4).maxLength(12);

  KeyedValue<IsValid> _testInput(String value) {
    return KeyedValue<IsValid>(
      key: Object(),
      value: _inputValidation.test(value),
    );
  }

  void _onInputChanged(_InputChanged event, Emitter<TextValidationState> emit) {
    emit(state.copyWith(
      input: event.value,
      isValid: _testInput(event.value),
    ));
  }

  void _onValidationCleared(
    _ValidationCleared event,
    Emitter<TextValidationState> emit,
  ) {
    emit(state.copyWith(
      isValid: _defaultIsValid,
    ));
  }

  void _onSubmitted(_Submitted event, Emitter<TextValidationState> emit) {
    emit(state.copyWith(
      isValid: _testInput(state.input),
    ));
  }
}
