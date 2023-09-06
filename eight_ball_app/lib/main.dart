import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Ask Me Everything!"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: const BallPage(),
      ),
    ),
  );
}

class BallPage extends StatefulWidget {
  const BallPage({super.key});

  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {

  int num = 1;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: (){
            setState(() {
              num = 1 + Random().nextInt(5-1);
            });
          },
          child: Image.asset('images/ball$num.png'),
        ),
      ),
    );
  }
}
