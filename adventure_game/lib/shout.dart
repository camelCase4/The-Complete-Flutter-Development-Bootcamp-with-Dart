import 'package:flutter/material.dart';

class ShoutPage extends StatelessWidget {
  const ShoutPage({super.key});

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
                    height: 120,
                  ),
                  const Text(
                    "Somebody heard you and saved the heck out of you! congrats u lived!",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 180,
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