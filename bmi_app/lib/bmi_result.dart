import 'dart:math';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int age;
  final int weight;
  final int height;
  final String gender;

  const ResultPage({
    super.key,
    required this.age,
    required this.weight,
    required this.height,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Result"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        FinalRes(
                          double.parse(
                            calculateResult(weight, height),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 30,
                          color: getColor(
                            double.parse(
                              calculateResult(weight, height),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        calculateResult(weight, height),
                        style: const TextStyle(fontSize: 50),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        description(
                          double.parse(
                            calculateResult(weight, height),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) {
                          return const BmiApp();
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "RE-CALCULATE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

String calculateResult(int weight, int height) {
  double res = weight / (pow(height / 100, 2));
  return res.toInt().toString();
}

Color getColor(double bmi) {
  return bmi >= 30
      ? Colors.red
      : (bmi < 30 && bmi > 24)
          ? Colors.red
          : (bmi < 25 && bmi > 17)
              ? Colors.green
              : (bmi < 18)
                  ? Colors.red
                  : Colors.red;
}

String description(double res) {
  return res >= 18 && res <= 24 ? "You are healthy" : "Control your diet!";
}

String FinalRes(double bmi) {
  return bmi >= 30
      ? "OBESE"
      : (bmi < 30 && bmi > 24)
          ? "OVERWEIGHT"
          : (bmi < 25 && bmi > 17)
              ? "HEALTHY"
              : (bmi < 18 && bmi > 10)
                  ? "UNDERWEIGHT"
                  : "YOU ARE LIKE A STICK!";
}
