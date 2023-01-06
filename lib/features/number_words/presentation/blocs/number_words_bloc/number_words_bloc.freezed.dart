// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'number_words_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NumberWordsEvent {}

/// @nodoc

class _$_InputChanged implements _InputChanged {
  _$_InputChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'NumberWordsEvent.inputChanged(value: $value)';
  }
}

abstract class _InputChanged implements NumberWordsEvent {
  factory _InputChanged(final String value) = _$_InputChanged;

  String get value;
}

/// @nodoc

class _$_Submitted implements _Submitted {
  _$_Submitted();

  @override
  String toString() {
    return 'NumberWordsEvent.submitted()';
  }
}

abstract class _Submitted implements NumberWordsEvent {
  factory _Submitted() = _$_Submitted;
}

/// @nodoc
mixin _$NumberWordsState {
  String get input => throw _privateConstructorUsedError;
  String get outputInWords => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NumberWordsStateCopyWith<NumberWordsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NumberWordsStateCopyWith<$Res> {
  factory $NumberWordsStateCopyWith(
          NumberWordsState value, $Res Function(NumberWordsState) then) =
      _$NumberWordsStateCopyWithImpl<$Res, NumberWordsState>;
  @useResult
  $Res call({String input, String outputInWords});
}

/// @nodoc
class _$NumberWordsStateCopyWithImpl<$Res, $Val extends NumberWordsState>
    implements $NumberWordsStateCopyWith<$Res> {
  _$NumberWordsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? outputInWords = null,
  }) {
    return _then(_value.copyWith(
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      outputInWords: null == outputInWords
          ? _value.outputInWords
          : outputInWords // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NumberWordsStateCopyWith<$Res>
    implements $NumberWordsStateCopyWith<$Res> {
  factory _$$_NumberWordsStateCopyWith(
          _$_NumberWordsState value, $Res Function(_$_NumberWordsState) then) =
      __$$_NumberWordsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String input, String outputInWords});
}

/// @nodoc
class __$$_NumberWordsStateCopyWithImpl<$Res>
    extends _$NumberWordsStateCopyWithImpl<$Res, _$_NumberWordsState>
    implements _$$_NumberWordsStateCopyWith<$Res> {
  __$$_NumberWordsStateCopyWithImpl(
      _$_NumberWordsState _value, $Res Function(_$_NumberWordsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? outputInWords = null,
  }) {
    return _then(_$_NumberWordsState(
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      outputInWords: null == outputInWords
          ? _value.outputInWords
          : outputInWords // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NumberWordsState implements _NumberWordsState {
  const _$_NumberWordsState({this.input = '0', this.outputInWords = ''});

  @override
  @JsonKey()
  final String input;
  @override
  @JsonKey()
  final String outputInWords;

  @override
  String toString() {
    return 'NumberWordsState(input: $input, outputInWords: $outputInWords)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NumberWordsState &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.outputInWords, outputInWords) ||
                other.outputInWords == outputInWords));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, outputInWords);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NumberWordsStateCopyWith<_$_NumberWordsState> get copyWith =>
      __$$_NumberWordsStateCopyWithImpl<_$_NumberWordsState>(this, _$identity);
}

abstract class _NumberWordsState implements NumberWordsState {
  const factory _NumberWordsState(
      {final String input, final String outputInWords}) = _$_NumberWordsState;

  @override
  String get input;
  @override
  String get outputInWords;
  @override
  @JsonKey(ignore: true)
  _$$_NumberWordsStateCopyWith<_$_NumberWordsState> get copyWith =>
      throw _privateConstructorUsedError;
}
