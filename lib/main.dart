import 'dart:io';
import 'screens/result_page.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/hexColor/hexColor.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          primaryColor: HexColor('#090C22'),
          scaffoldBackgroundColor: HexColor('#090C22'),
          appBarTheme: AppBarTheme(
            backgroundColor: HexColor('#090C22'),
          ),
          textTheme: TextTheme(

          ),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: HexColor('#EA1556')),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: HexColor('#EA1556')
      )),
      routes: {
        '/': (context) => InputPage(),
        '/results': (context) => ResultPage(),
      },
      initialRoute: '/',
    );
  }
}


