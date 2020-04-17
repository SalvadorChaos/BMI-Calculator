import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    this.height,
    this.weight,
    this.changedUnits,
  });

  final int height;
  final int weight;
  bool changedUnits = false;

  double _bmi;

  String calculateInChosenUnits() {
    if (changedUnits == false) {
      print('US');
      return bmiCalculateInPoundsAndInches();
    } else {
      print('UK');
      return bmiCalculateInKilogramsAndCentimeters();
    }
  }

  String bmiCalculateInPoundsAndInches() {
    _bmi = 703 * weight / pow(height, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiCalculateInKilogramsAndCentimeters() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Your body weight is too high. Try exercising more and/or eating less.';
    } else if (_bmi > 18.5) {
      return 'Your body weight is normal. Good job! Keep doing you.';
    } else {
      return 'Your body weight is too low. Try eating more and/or gain some muscle.';
    }
  }
}
