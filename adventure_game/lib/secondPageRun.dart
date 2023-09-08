import 'package:adventure_game/makeaneffort.dart';
import 'package:adventure_game/shout.dart';
import 'package:flutter/material.dart';

class runSecondPage extends StatelessWidget {
  const runSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bgimage.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  const Text(
                    "you ran as fast as you can ang suddenly fell into a ditch, and broke ur leg.",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 180,
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return const ShoutPage();
                                },
                              ),
                            );
                          },
                          child: Container(
                            color: Colors.green,
                            child: const Center(
                              child: Text(
                                "shout for help and do nothing!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Builder(builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const MakeAnEffort();
                              },
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.green,
                          child: const Center(
                            child: Text(
                              "make an effort and try climbing back up again!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
