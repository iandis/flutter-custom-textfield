import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/components/number_words_input_text_field.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/components/number_words_output_text_field.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/components/number_words_submit_button.dart';

class NumberWordsContainer extends StatelessWidget {
  const NumberWordsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const double maxWidth = 400;
          final double width = math.min(
            maxWidth,
            constraints.maxWidth,
          );
          return SizedBox(
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  'Please enter an integer number in the "Input" box '
                  'and tap on "Convert" to see the equivalent in words appear '
                  'in the "Output" box.',
                ),
                Spacer(),
                NumberWordsInputTextField(),
                Spacer(),
                NumberWordsOutputTextField(),
                Spacer(flex: 2),
                NumberWordsSubmitButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
