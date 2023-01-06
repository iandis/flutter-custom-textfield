import 'package:flutter/material.dart';
import 'package:flutter_custom_textfield/features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom TextField App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        errorColor: Colors.red.shade900,
        inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.grey.shade700),
          hintStyle: TextStyle(color: Colors.grey.shade400),
          prefixIconColor: MaterialStateColor.resolveWith(
            (_) => Colors.grey.shade400,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red.shade900,
              width: 2.0,
            ),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
