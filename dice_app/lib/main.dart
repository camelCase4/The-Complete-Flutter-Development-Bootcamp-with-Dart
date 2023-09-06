import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Dice"),
        backgroundColor: Colors.red,
      ),
      body: const DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  Random rn1 = new Random();
  Random rn2 = new Random();
  int theCurrentDie1 = 1;
  int theCurrentDie2 = 1;
  int counter = 0;
  int total = 0;
  bool clicked = false;
  String res = "Results";


  void test()
  {
    theCurrentDie1 = 1 + rn1.nextInt(7 - 1);
    theCurrentDie2 = 1 + rn2.nextInt(7 - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${res}: ${total}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Row(
           
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(
                      () {
                        
                        /*theCurrentDie1 = 1 + rn1.nextInt(7 - 1);
                        theCurrentDie2 = 1 + rn2.nextInt(7 - 1);*/
                        test();
                        total += theCurrentDie1;
                        
                        
                      },
                    );
                  },
                  child: Image.asset("images/dice${theCurrentDie1}.png"),
                ),
              ),
               Expanded(
            child: TextButton(
              onPressed: () {
                setState(
                  () {
                    /*theCurrentDie1 = 1 + rn1.nextInt(7 - 1);
                    theCurrentDie2 = 1 + rn2.nextInt(7 - 1);*/
                    test();

                    total += theCurrentDie2;
                  },
                );
              },
              child: Image.asset("images/dice${theCurrentDie2}.png"),
            ),
          ),
            ],
          ),
         
        ],
      ),
    );
  }
}


