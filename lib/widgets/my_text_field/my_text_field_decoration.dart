import 'package:flutter/material.dart';

class MyTextFieldDecoration {
  const MyTextFieldDecoration({
    this.prefix,
    this.suffix,
    this.labelText,
    this.hintText,
    this.counterText,
    this.errorText,
    this.errorTextReshowOnChangedOnly = true,
  });

  /// Optional widget to place on the line before the input.
  ///
  /// This can be used to add a custom widget in front of the input.
  /// The widget's baseline is lined up with the input
  /// baseline.
  ///
  /// See also:
  ///
  ///  * [suffix], the equivalent but on the trailing edge.
  final Widget? prefix;

  /// Optional widget to place on the line after the input.
  ///
  /// This can be used to add a custom widget after the input.
  /// The widget's baseline is lined up with the input baseline.
  ///
  /// The [suffix] appears after the [errorText] tooltip icon,
  /// if both are specified.
  ///
  /// See also:
  ///
  ///  * [prefix], the equivalent but on the leading edge.
  final Widget? suffix;

  final String? labelText;
  final String? hintText;
  final String? counterText;

  /// The error text to display at the end of the input field.
  /// If null, no error text is displayed.
  /// 
  /// The [errorText] can be anything because there might be a case where
  /// [errorText] needs to be shown again without changing its text.
  final Object? errorText;
  final bool errorTextReshowOnChangedOnly;
}
