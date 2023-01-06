// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_validation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextValidationEvent {}

/// @nodoc

class _$_InputChanged implements _InputChanged {
  _$_InputChanged(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'TextValidationEvent.inputChanged(value: $value)';
  }
}

abstract class _InputChanged implements TextValidationEvent {
  factory _InputChanged(final String value) = _$_InputChanged;

  String get value;
}

/// @nodoc

class _$_ValidationCleared implements _ValidationCleared {
  _$_ValidationCleared();

  @override
  String toString() {
    return 'TextValidationEvent.validationCleared()';
  }
}

abstract class _ValidationCleared implements TextValidationEvent {
  factory _ValidationCleared() = _$_ValidationCleared;
}

/// @nodoc

class _$_Submitted implements _Submitted {
  _$_Submitted();

  @override
  String toString() {
    return 'TextValidationEvent.submitted()';
  }
}

abstract class _Submitted implements TextValidationEvent {
  factory _Submitted() = _$_Submitted;
}

/// @nodoc
mixin _$TextValidationState {
  String get input => throw _privateConstructorUsedError;
  KeyedValue<IsValid> get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextValidationStateCopyWith<TextValidationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextValidationStateCopyWith<$Res> {
  factory $TextValidationStateCopyWith(
          TextValidationState value, $Res Function(TextValidationState) then) =
      _$TextValidationStateCopyWithImpl<$Res, TextValidationState>;
  @useResult
  $Res call({String input, KeyedValue<IsValid> isValid});
}

/// @nodoc
class _$TextValidationStateCopyWithImpl<$Res, $Val extends TextValidationState>
    implements $TextValidationStateCopyWith<$Res> {
  _$TextValidationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as KeyedValue<IsValid>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextValidationStateCopyWith<$Res>
    implements $TextValidationStateCopyWith<$Res> {
  factory _$$_TextValidationStateCopyWith(_$_TextValidationState value,
          $Res Function(_$_TextValidationState) then) =
      __$$_TextValidationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String input, KeyedValue<IsValid> isValid});
}

/// @nodoc
class __$$_TextValidationStateCopyWithImpl<$Res>
    extends _$TextValidationStateCopyWithImpl<$Res, _$_TextValidationState>
    implements _$$_TextValidationStateCopyWith<$Res> {
  __$$_TextValidationStateCopyWithImpl(_$_TextValidationState _value,
      $Res Function(_$_TextValidationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? input = null,
    Object? isValid = null,
  }) {
    return _then(_$_TextValidationState(
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as KeyedValue<IsValid>,
    ));
  }
}

/// @nodoc

class _$_TextValidationState implements _TextValidationState {
  const _$_TextValidationState(
      {this.input = '', this.isValid = _defaultIsValid});

  @override
  @JsonKey()
  final String input;
  @override
  @JsonKey()
  final KeyedValue<IsValid> isValid;

  @override
  String toString() {
    return 'TextValidationState(input: $input, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextValidationState &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, input, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextValidationStateCopyWith<_$_TextValidationState> get copyWith =>
      __$$_TextValidationStateCopyWithImpl<_$_TextValidationState>(
          this, _$identity);
}

abstract class _TextValidationState implements TextValidationState {
  const factory _TextValidationState(
      {final String input,
      final KeyedValue<IsValid> isValid}) = _$_TextValidationState;

  @override
  String get input;
  @override
  KeyedValue<IsValid> get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_TextValidationStateCopyWith<_$_TextValidationState> get copyWith =>
      throw _privateConstructorUsedError;
}
