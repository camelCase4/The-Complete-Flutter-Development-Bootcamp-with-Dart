import 'package:bmi_app/bmi_result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatefulWidget {
  const BmiApp({super.key});

  @override
  State<BmiApp> createState() => _BmiAppState();
}

class _BmiAppState extends State<BmiApp> {
  double _sliderVal = 0;
  int _hgt = 0;
  int _wht = 0;
  int _age = 0;
  Color clr = Colors.white;
  Color clr2 = Colors.white;
  String gen = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text("BMI Calculator"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    //----
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Card(
                              color: getColor(clr),
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          clr = Colors.black12;
                                          clr2 = Colors.white;
                                          gen = "Male";
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                        'images/icons8-male-64.png'),
                                  ),
                                  SizedBox(
                                    height: 19,
                                  ),
                                  Text(
                                    "MALE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Expanded(
                            child: Card(
                              color: getColor2(clr2),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          clr2 = Colors.black12;
                                          clr = Colors.white;
                                          gen = "Female";
                                        },
                                      );
                                    },
                                    child: Image.asset(
                                        'images/icons8-female-50.png'),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "FEMALE",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    //---
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "HEIGHT",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$_hgt",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                children: [
                                  Text(""),
                                  Text(
                                    "CM",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Slider(
                            value: _sliderVal,
                            max: 200,
                            divisions: 200,
                            onChanged: (double value) {
                              setState(
                                () {
                                  _sliderVal = value;
                                  _hgt = value.round();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    //---
                    child: Row(
                      children: [
                        Expanded(
                          //---
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "WEIGHT",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$_wht",
                                  style: TextStyle(fontSize: 50),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _wht--;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _wht += 5;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          //---
                          child: Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "AGE",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "$_age",
                                  style: TextStyle(fontSize: 50),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      //---
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _age--;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(5),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      //---
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _age += 5;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding: const EdgeInsets.all(5),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    //---
                    child: SizedBox(
                      width: double.infinity,
                      child: Builder(
                        builder: (context) {
                          return TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ResultPage(
                                      age: _age,
                                      weight: _wht,
                                      height: _hgt,
                                      gender: gen,
                                    );
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              "CALCULATE",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Color getColor(clr) {
  return clr;
}

Color getColor2(clr2) {
  return clr2;
}
