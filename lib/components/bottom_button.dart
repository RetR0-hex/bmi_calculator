import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;

  BottomButton({@required this.buttonText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: KBottomButtonColor,
        ),
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            buttonText,
            style: KBottomButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
