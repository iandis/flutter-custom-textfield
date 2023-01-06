import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/blocs/number_words_bloc/number_words_bloc.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/components/number_with_min_value_input_formatter.dart';
import 'package:flutter_custom_textfield/widgets/my_text_field/my_text_field.dart';
import 'package:flutter_custom_textfield/widgets/my_text_field/my_text_field_decoration.dart';

class NumberWordsInputTextField extends StatelessWidget {
  const NumberWordsInputTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NumberWordsBloc, NumberWordsState>(
      buildWhen: (NumberWordsState previous, NumberWordsState current) {
        return previous.input != current.input;
      },
      builder: (BuildContext context, NumberWordsState state) {
        return MyTextField(
          value: state.input,
          onChanged: (String value) => context
              .read<NumberWordsBloc>()
              .add(NumberWordsEvent.inputChanged(value)),
          maxLines: 1,
          // Max number is 999,999,999,999,999 (withou commas)
          maxLength: 15,
          inputType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            const NumberWithMinValueInputFormatter(),
          ],
          decoration: const MyTextFieldDecoration(
            labelText: 'Input',
            hintText: 'Input a number',
            counterText: '',
          ),
        );
      },
    );
  }
}
