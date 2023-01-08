import 'package:flutter/material.dart';
import 'package:bmi_calculator/hexColor/hexColor.dart';
import '../components/icon_content.dart';
import '../components/custom_card.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/custom_rounded_Icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.Male;
  int height = 121;
  int weight = 50;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                CustomCard(
                  onTap: () {
                    setState(
                      () {
                        selectedGender = Gender.Male;
                      },
                    );
                  },
                  activeColor: selectedGender == Gender.Male
                      ? KActiveColor
                      : KInActiveColor,
                  cardChild: IconWidget(FontAwesomeIcons.mars, "Male"),
                ),
                CustomCard(
                  onTap: () {
                    setState(
                      () {
                        selectedGender = Gender.Female;
                      },
                    );
                  },
                  activeColor: selectedGender == Gender.Female
                      ? KActiveColor
                      : KInActiveColor,
                  cardChild: IconWidget(FontAwesomeIcons.venus, "Female"),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: KBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT", style: KTextStyle),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: KNumberStyle),
                        Text("cm", style: KTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          min: 120,
                          max: 300,
                          value: height.toDouble(),
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double value) {
                            setState(() {
                              height = value.toInt();
                            });
                          }),
                    )
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                CustomCard(
                  activeColor: KBgColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("WEIGHT", style: KTextStyle),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(weight.toString(), style: KNumberStyle),
                          Text("kg", style: KTextStyle),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRoundedIconButtons(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight > 15 ? weight-- : null;
                              });
                            },
                          ),
                          SizedBox(width: 15),
                          CustomRoundedIconButtons(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight < 350 ? weight++ : null;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CustomCard(
                  activeColor: KBgColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("AGE", style: KTextStyle),
                      SizedBox(height: 10),
                      Text(age.toString(), style: KNumberStyle),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomRoundedIconButtons(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                age > 5 ? age-- : null;
                              });
                            },
                          ),
                          SizedBox(width: 15),
                          CustomRoundedIconButtons(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age < 120 ? age++ : null;
                              });
                            }
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            BottomButton(
              buttonText: "CALCULATE YOUR BMI",
              onPressed: (){
                CalculatorBrain bmiCalc = CalculatorBrain(height: height, weight: weight);
                Navigator.pushNamed(context,
                    '/results',
                    arguments: {"bmi" : bmiCalc.calcBMI(),
                      "result": bmiCalc.getResult(),
                      "interpretation": bmiCalc.getInterpretation(),
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
