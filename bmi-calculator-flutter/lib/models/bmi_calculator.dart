import 'dart:math';

class BmiCalculator {
  BmiCalculator({this.height, this.weight});

  final double height;
  final double weight;

  double _bmi;

  String getBmiResult() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getTextResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.0) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getResultInterpretation() {
    if (_bmi >= 25.0) {
      return 'You are overweight. You could try a new exercise routine';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a below average body weight.';
    }
  }
}
