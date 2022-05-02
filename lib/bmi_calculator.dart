import 'package:flutter/material.dart';
import 'dart:math';

class BmiCalculator {
  BmiCalculator({@required this.height, @required this.weight});
  final int height;
  final int weight;
  double _bmi;

  String bmi() {
    _bmi = weight / (pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'You have higher than the normal body weight, Try exercising more';
    } else if (_bmi > 18.5) {
      return 'You have normal body weight! Great Job!!!';
    } else {
      return 'You have a lower than a normal body weight!, You should eat more';
    }
  }

  String heading() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }
}
