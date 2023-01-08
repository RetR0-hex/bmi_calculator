import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;

  double _bmi;

  CalculatorBrain({this.weight, this.height});

  String calcBMI() {
    _bmi = this.weight / pow(this.height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    String result = null;
    if (_bmi >= 25) {
      result = 'OVERWEIGHT';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      result = 'NORMAL';
    } else {
      result = 'UNDERWEIGHT';
    }

    return result;
  }

  String getInterpretation() {
    String result = null;
    if (_bmi >= 25) {
      result = "You're overweight, try to reduce eating food";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      result = "You've normal BMI, good job!";
    } else {
      result = "You're underweight, try to eat more food!";
    }

    return result;
  }
}
