part of 'number_words_bloc.dart';

@freezedBlocEvent
class NumberWordsEvent with _$NumberWordsEvent {
  factory NumberWordsEvent.inputChanged(String value) = _InputChanged;
  factory NumberWordsEvent.submitted() = _Submitted;
}
