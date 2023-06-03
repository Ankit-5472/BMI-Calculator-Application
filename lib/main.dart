import 'package:bmi_calculator/screen/widgetBox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculator());
}

class BmiCalculator extends StatelessWidget {
  const BmiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF0A0E21),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF0A0E21),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          )),
      home:  widgetBox(),
    );
  }
}
