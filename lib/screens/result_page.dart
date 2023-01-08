import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> getdata =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR")),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              child: Text("Your Result", style: KNumberStyle),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: KActiveColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                padding: EdgeInsets.all(30),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      getdata["result"],
                      style: TextStyle(
                          color: getdata["result"] != "NORMAL"
                              ? Colors.red
                              : Colors.green,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      getdata["bmi"],
                      style: KResultPageContainerTextStyle,
                    ),
                    SizedBox(height: 30),
                    Text(getdata["interpretation"],
                        textAlign: TextAlign.center,
                        style: KResultPageBodyTextStyle),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonText: "RE-CALCULATE YOUR BMI",
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
