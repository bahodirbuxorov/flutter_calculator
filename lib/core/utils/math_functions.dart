import 'dart:math';

class MathFunctions {
  static double calculateSin(double value) => sin(value);
  static double calculateCos(double value) => cos(value);
  static double calculateTan(double value) => tan(value);
  static double calculateSqrt(double value) => sqrt(value);
  static double calculateLog(double value) => log(value);
  static double add(double a, double b) => a + b;
  static double subtract(double a, double b) => a - b;
  static double multiply(double a, double b) => a * b;
  static double divide(double a, double b) => a / b;
  static double percentage(double value, double percent) => (value * percent) / 100;
}
