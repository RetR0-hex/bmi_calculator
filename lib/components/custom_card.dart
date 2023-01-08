import 'package:flutter/material.dart';
import 'package:bmi_calculator/hexColor/hexColor.dart';

class CustomCard extends StatelessWidget {
  final Widget cardChild;
  final Color activeColor;
  Null Function() onTap;
  CustomCard({this.cardChild, this.activeColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: activeColor,
              borderRadius: BorderRadius.circular(10),
          ),
          height: 200,
          width: double.infinity,
          margin: EdgeInsets.all(15),
          child: cardChild,
        ),
      ),
    );
  }
}