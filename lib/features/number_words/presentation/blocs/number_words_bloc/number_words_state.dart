part of 'number_words_bloc.dart';

@freezed
class NumberWordsState with _$NumberWordsState {
  const factory NumberWordsState({
    @Default('0') String input,
    @Default('') String outputInWords,
  }) = _NumberWordsState;

  static const NumberWordsState empty = NumberWordsState();
}
