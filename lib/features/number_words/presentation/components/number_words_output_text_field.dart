import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/blocs/number_words_bloc/number_words_bloc.dart';
import 'package:flutter_custom_textfield/widgets/my_text_field/my_text_field.dart';
import 'package:flutter_custom_textfield/widgets/my_text_field/my_text_field_decoration.dart';

class NumberWordsOutputTextField extends StatelessWidget {
  const NumberWordsOutputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberWordsBloc, NumberWordsState>(
      buildWhen: (NumberWordsState previous, NumberWordsState current) {
        return previous.outputInWords != current.outputInWords;
      },
      builder: (BuildContext context, NumberWordsState state) {
        return MyTextField(
          value: state.outputInWords,
          minLines: 3,
          maxLines: null,
          isReadOnly: true,
          decoration: const MyTextFieldDecoration(
            labelText: 'Output',
            hintText: 'Output in words',
          ),
        );
      },
    );
  }
}
