import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_custom_textfield/features/text_validation/presentation/components/text_validation_submit_button.dart';
import 'package:flutter_custom_textfield/features/text_validation/presentation/components/validated_text_field.dart';

class TextValidationContainer extends StatelessWidget {
  const TextValidationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const double maxWidth = 300;
          final double width = math.min(
            maxWidth,
            constraints.maxWidth,
          );
          return SizedBox(
            width: width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                ValidatedTextField(),
                SizedBox(height: 16),
                TextValidationSubmitButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
