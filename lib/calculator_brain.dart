import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double _bmi = 0;
  String msgResult = "";
  String msgDesc = "";

  String calculateBmi() {
     _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      msgResult = "OverWeight";
      return msgResult;
    } else if (_bmi > 18) {
      msgResult = "Normal";
      return msgResult;
    } else {
      msgResult = "UnderWeight";
      return msgResult;
    }
  }

  String getDesc() {
    if (_bmi >= 25) {
      msgDesc = 'Exercise More! You have to work hard on yourself';
      return msgDesc;
    } else if (_bmi > 18) {
      msgDesc = 'Very good! You are taking care of yourself';
      return msgDesc;
    } else {
      msgDesc = 'Eat More! you have to be little lazy because you have lower body weight';
      return msgDesc;
    }
  }
}
