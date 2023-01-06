import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_textfield/shared/entities/keyed_string.dart';
import 'package:flutter_custom_textfield/widgets/my_tappable_tooltip/my_tappable_tooltip.dart';
import 'package:flutter_custom_textfield/widgets/my_text_field/my_text_field_decoration.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    this.value,
    this.onChanged,
    this.inputFormatters,
    this.inputType,
    this.isReadOnly = false,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
    this.decoration,
  });

  final String? value;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final bool isReadOnly;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final MyTextFieldDecoration? decoration;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final KeyedString? errorText = widget.decoration?.errorText;
    final Widget? suffix = widget.decoration?.suffix;

    final InputDecorationTheme inputDecorationTheme =
        Theme.of(context).inputDecorationTheme;
    final InputBorder? errorBorder = inputDecorationTheme.errorBorder;
    final InputBorder? focusedErrorBorder =
        inputDecorationTheme.focusedErrorBorder;

    Widget result = TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.inputType,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.isReadOnly,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        hintText: widget.decoration?.hintText,
        contentPadding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
        counterText: widget.decoration?.counterText,
        prefixIcon: widget.decoration?.prefix,
        suffixIcon: errorText != null || suffix != null
            ? _MyTextFieldSuffixWidget(
                errorText: errorText,
                errorTextReshowOnChangedOnly:
                    widget.decoration?.errorTextReshowOnChangedOnly ?? true,
                suffix: suffix,
              )
            : null,
        border: errorText != null ? errorBorder : null,
        enabledBorder: errorText != null ? errorBorder : null,
        focusedBorder: errorText != null ? focusedErrorBorder : null,
      ),
    );

    final String? labelText = widget.decoration?.labelText;
    if (labelText != null) {
      final TextStyle? labelStyle = inputDecorationTheme.labelStyle;
      result = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              labelText,
              style: labelStyle,
            ),
          ),
          const SizedBox(height: 4),
          result,
        ],
      );
    }

    return result;
  }

  @override
  void didUpdateWidget(MyTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_controller.text != widget.value) {
      _controller.text = widget.value ?? '';
    }
  }
}

class _MyTextFieldSuffixWidget extends StatelessWidget {
  const _MyTextFieldSuffixWidget({
    this.errorText,
    required this.errorTextReshowOnChangedOnly,
    this.suffix,
  }) : assert(
          suffix != null || errorText != null,
          'At least one of suffix and errorText must be specified',
        );

  final KeyedString? errorText;
  final bool errorTextReshowOnChangedOnly;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    if (suffix == null && errorText == null) return const SizedBox.shrink();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (errorText != null)
          MyTappableTooltip(
            text: errorText!,
            iconData: Icons.info,
            iconColor: Colors.red.shade900,
            tooltipAlignment: Alignment.topCenter,
            tooltipColor: Colors.red.shade900,
            tooltipPosition: -0.7,
            tooltipTailBaseWidth: 12.0,
            tooltipTailLength: 8.0,
            tooltipMargin: const EdgeInsets.fromLTRB(8, 8, 8, 4),
          ),
        if (suffix != null) suffix!,
      ],
    );
  }
}
