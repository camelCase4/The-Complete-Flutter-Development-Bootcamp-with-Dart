import 'package:flutter/material.dart';

class GetARopePage extends StatelessWidget {
  const GetARopePage({super.key});

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
                    "you basically hang yourself! it was not a venomous snake!",
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