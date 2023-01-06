import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_custom_textfield/features/number_words/presentation/blocs/number_words_bloc/number_words_bloc.dart';
import 'package:flutter_custom_textfield/features/number_words/presentation/components/number_words_container.dart';
import 'package:flutter_custom_textfield/features/text_validation/presentation/blocs/text_validation_bloc/text_validation_bloc.dart';
import 'package:flutter_custom_textfield/features/text_validation/presentation/components/text_validation_container.dart';

enum _HomeTab {
  textValidation('Text Validation'),
  numberWords('Number to Words');

  const _HomeTab(this.title);
  final String title;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<_HomeTab> _selectedTab =
      ValueNotifier<_HomeTab>(_HomeTab.textValidation);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextValidationBloc _textValidationBloc = TextValidationBloc();
  final NumberWordsBloc _numberWordsBloc = NumberWordsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: _selectedTab,
          builder: (_, _HomeTab value, __) {
            return Text(value.title);
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(_HomeTab.textValidation.title),
              onTap: () => _changeTab(_HomeTab.textValidation),
            ),
            ListTile(
              title: Text(_HomeTab.numberWords.title),
              onTap: () => _changeTab(_HomeTab.numberWords),
            )
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _selectedTab,
        builder: (_, _HomeTab value, __) {
          switch (value) {
            case _HomeTab.textValidation:
              return BlocProvider<TextValidationBloc>.value(
                value: _textValidationBloc,
                child: const TextValidationContainer(),
              );
            case _HomeTab.numberWords:
              return BlocProvider<NumberWordsBloc>.value(
                value: _numberWordsBloc,
                child: const NumberWordsContainer(),
              );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _textValidationBloc.close();
    _numberWordsBloc.close();
    super.dispose();
  }

  void _changeTab(_HomeTab destinationTab) {
    _scaffoldKey.currentState?.closeDrawer();
    _selectedTab.value = destinationTab;
    if (destinationTab == _HomeTab.numberWords) {
      _textValidationBloc.add(TextValidationEvent.validationCleared());
    }
  }
}
