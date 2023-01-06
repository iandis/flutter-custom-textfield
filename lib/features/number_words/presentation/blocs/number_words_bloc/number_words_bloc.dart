import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_textfield/features/number_words/utils/number_to_words_ext.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_custom_textfield/shared/annotations/freezed_bloc_event.dart';

part 'number_words_bloc.freezed.dart';
part 'number_words_event.dart';
part 'number_words_state.dart';

class NumberWordsBloc extends Bloc<NumberWordsEvent, NumberWordsState> {
  NumberWordsBloc() : super(NumberWordsState.empty) {
    on<_InputChanged>(_onInputChanged);
    on<_Submitted>(_onSubmitted);
  }

  void _onInputChanged(_InputChanged event, Emitter<NumberWordsState> emit) {
    final String value = event.value;
    if (int.tryParse(value) == null) return;
    emit(state.copyWith(
      input: value,
    ));
  }

  void _onSubmitted(_Submitted event, Emitter<NumberWordsState> emit) {
    emit(state.copyWith(
      outputInWords: state.input.numberToWords,
    ));
  }
}
