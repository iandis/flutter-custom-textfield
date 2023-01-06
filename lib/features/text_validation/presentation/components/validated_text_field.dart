import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_textfield/features/text_validation/presentation/blocs/text_validation_bloc/text_validation_bloc.dart';
import 'package:flutter_custom_textfield/features/text_validation/presentation/components/username_text_field.dart';
import 'package:flutter_custom_textfield/shared/entities/keyed_string.dart';
import 'package:flutter_custom_textfield/shared/validation/string_validation.dart';

class ValidatedTextField extends StatelessWidget {
  const ValidatedTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextValidationBloc, TextValidationState>(
      builder: (BuildContext context, TextValidationState state) {
        final String? errorString = getErrorText(state.isValid.value);
        final KeyedString? errorText = errorString != null
            ? KeyedString(key: state.isValid.key, value: errorString)
            : null;
        return UsernameTextField(
          value: state.input,
          onChanged: (String value) => context
              .read<TextValidationBloc>()
              .add(TextValidationEvent.inputChanged(value)),
          errorText: errorText,
        );
      },
    );
  }

  @visibleForTesting
  static String? getErrorText(IsValid isValid) {
    switch (isValid) {
      case IsValid.empty:
        return 'Cannot be empty';
      case IsValid.tooShort:
        return 'Too short';
      case IsValid.tooLong:
        return 'Too long';
      case IsValid.invalid:
        return 'Can only contain letters';
      case IsValid.valid:
        return null;
    }
  }
}
