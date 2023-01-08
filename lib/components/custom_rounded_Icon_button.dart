import 'package:flutter/material.dart';
import '../constants.dart';

class CustomRoundedIconButtons extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;

  CustomRoundedIconButtons({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: KActiveColor,
        shape: CircleBorder(),
        padding: EdgeInsets.all(20),
      ),
      child: Icon(icon, size: 30),
    );
  }
}
