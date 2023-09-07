import 'package:flutter/material.dart';

void main() {
  runApp(const QuizlerApp());
}

class QuizlerApp extends StatefulWidget {
  const QuizlerApp({super.key});

  @override
  State<QuizlerApp> createState() => _QuizlerAppState();
}

class _QuizlerAppState extends State<QuizlerApp> {
  List<IconData> result = [];
  int indexPlacement = 0;
  int answer = -1;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    List<String> questions = [
      "Is Roger Jay Sering Handsome?",
      "Is Roger Jay Sering's age 22?",
      "Is He Single?",
      "Is he born on July 28, 2001?",
      "Is he a beginner?",
      "Your Score is $score"
    ];
    List<int> corrects = [1, 1, 0, 0, 1];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quiz"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Expanded(
                  child: Text(
                    questions[indexPlacement],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          answer = 1;
                          if (indexPlacement != 5 &&
                              answer == corrects[indexPlacement]) {
                            setState(() {
                              result.add(Icons.check);
                              score++;
                            });
                          } else {
                            if (indexPlacement <= 4) {
                              setState(() {
                                result.add(Icons.close);
                              });
                            }
                          }
                          if (indexPlacement != 5) {
                            indexPlacement++;
                          }
                          answer = -1;
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Text(
                          "T R U E",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          answer = 0;
                          if (indexPlacement != 5 &&
                              answer == corrects[indexPlacement]) {
                            setState(() {
                              result.add(Icons.check);
                              score++;
                            });
                          } else {
                            if (indexPlacement <= 4) {
                              setState(() {
                                result.add(Icons.close);
                              });
                            }
                          }
                          if (indexPlacement != 5) {
                            indexPlacement++;
                          }

                          answer = -1;
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Text(
                          "F A L S E",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < result.length; i++)
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          result[i],
                          color: (result[i] == Icons.check) ? Colors.green : Colors.red,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
