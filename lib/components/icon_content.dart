import 'package:flutter/material.dart';
import 'package:bmi_calculator/hexColor/hexColor.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';


class IconWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.white, size: 70),
        SizedBox(height: 25.0),
        Text(text, style: KTextStyle)
      ],
    );
  }

  IconWidget(this.icon, this.text);
}