import 'package:flutter/material.dart';
import 'package:flutter_custom_textfield/widgets/my_text_field/my_text_field.dart';
import 'package:flutter_custom_textfield/widgets/my_text_field/my_text_field_decoration.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
    this.value,
    this.onChanged,
    this.errorText,
  });

  final String? value;
  final ValueChanged<String>? onChanged;
  final Object? errorText;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      value: value,
      onChanged: onChanged,
      decoration: MyTextFieldDecoration(
        hintText: 'Username',
        labelText: 'Username',
        prefix: const Icon(Icons.person),
        errorText: errorText,
        errorTextReshowOnChangedOnly: false,
      ),
    );
  }
}
