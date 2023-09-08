import 'package:flutter/material.dart';

class AcceptDeath extends StatelessWidget {
  const AcceptDeath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "you let yourself die! shame it was a python! (No Venom)",
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
      );
  }
}