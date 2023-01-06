import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_textfield/features/text_validation/presentation/blocs/text_validation_bloc/text_validation_bloc.dart';

class TextValidationSubmitButton extends StatelessWidget {
  const TextValidationSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context
          .read<TextValidationBloc>()
          .add(TextValidationEvent.submitted()),
      child: const Text('Submit'),
    );
  }
}
