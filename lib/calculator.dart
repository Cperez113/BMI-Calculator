import 'package:flutter/material.dart';
import 'dart:math';

class Calculate {
  Calculate({required this.height, required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI() {
    _bmi = (weight) / pow(height, 2);
    _bmi = _bmi * 10000;
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getReview() {
    if (_bmi >= 25) {
      return 'Your body weight is higher than normal. Excercising more may benifit you.';
    } else if (_bmi > 18.5) {
      return 'Your body weight is good. Keep up the great work.';
    } else {
      return 'your body weight is lower than the normal amount. Try intaking more calories per day.';
    }
  }
}
