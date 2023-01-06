import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/blocs/number_words_bloc/number_words_bloc.dart';

class NumberWordsSubmitButton extends StatelessWidget {
  const NumberWordsSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          context.read<NumberWordsBloc>().add(NumberWordsEvent.submitted()),
      child: const Text('Convert'),
    );
  }
}
