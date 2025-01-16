import 'package:flutter/material.dart';
import '../../core/utils/math_functions.dart';
import 'widgets/calculator_button.dart';
import 'widgets/display_area.dart';
import 'widgets/theme_switch_button.dart';
import '../../core/constants/colors.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String result = '';
  bool isDarkMode = false;

  void handleInput(String value) {
    setState(() {
      input += value;
    });
  }

  void calculateResult() {
    try {
      if (input.contains('sin') || input.contains('cos') || input.contains('tan')) {
        final value = double.parse(input.replaceAll(RegExp(r'[a-zA-Z]'), ''));
        if (input.contains('sin')) {
          result = MathFunctions.calculateSin(value).toString();
        } else if (input.contains('cos')) {
          result = MathFunctions.calculateCos(value).toString();
        } else if (input.contains('tan')) {
          result = MathFunctions.calculateTan(value).toString();
        }
      } else if (input.contains('%')) {
        final parts = input.split('%');
        if (parts.length == 2) {
          final value = double.parse(parts[0]);
          final percent = double.parse(parts[1]);
          result = MathFunctions.percentage(value, percent).toString();
        } else {
          result = 'Invalid Input';
        }
      } else {
        final RegExp regex = RegExp(r'([\d.]+)([\+\-\*/])([\d.]+)');
        final match = regex.firstMatch(input);

        if (match != null) {
          final a = double.parse(match.group(1)!);
          final operator = match.group(2)!;
          final b = double.parse(match.group(3)!);

          switch (operator) {
            case '+':
              result = MathFunctions.add(a, b).toString();
              break;
            case '-':
              result = MathFunctions.subtract(a, b).toString();
              break;
            case '*':
              result = MathFunctions.multiply(a, b).toString();
              break;
            case '/':
              result = b != 0 ? MathFunctions.divide(a, b).toString() : 'Error';
              break;
            default:
              result = 'Invalid operator';
          }
        } else {
          result = 'Invalid Input';
        }
      }
    } catch (e) {
      result = 'Error';
    }
    setState(() {});
  }

  void clearInput() {
    setState(() {
      input = '';
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
            ),
            child: AppBar(
              title: const Text(
                'Flutter Calculator',
                style: TextStyle(color: AppColors.textDark),
              ),
              backgroundColor:
              isDarkMode ? AppColors.backgroundDark : AppColors.primary,
              actions: [
                ThemeSwitchButton(
                  isDarkMode: isDarkMode,
                  onToggle: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },

                ),
              ],

            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: DisplayArea(input: input, result: result),
              ),
              const SizedBox(height: 16.0),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final labels = [
                    '7', '8', '9', '/',
                    '4', '5', '6', '*',
                    '1', '2', '3', '-',
                    'C', '0', '=', '+',
                    'sin', 'cos', 'tan', '%'
                  ];
                  final label = labels[index];

                  return CalculatorButton(
                    label: label,
                    onTap: () {
                      if (label == 'C') {
                        clearInput();
                      } else if (label == '=') {
                        calculateResult();
                      } else {
                        handleInput(label);
                      }
                    },
                    color: label == '='
                        ? (isDarkMode
                        ? AppColors.accentDark
                        : AppColors.accentLight)
                        : (isDarkMode
                        ? AppColors.buttonDark
                        : AppColors.buttonLight),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
