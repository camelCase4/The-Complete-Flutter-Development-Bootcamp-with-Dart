import 'package:flutter/material.dart';
import 'package:mi_card_flutter/businesscard.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Card"),
      ),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Builder(
              builder: (context) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const bCard();
                        },
                      ),
                    );
                  },
                  child: Container(
                    width: 100.0,
                    height: double.infinity,
                    color: Colors.white,
                    child: const Text("Container 1"),
                  ),
                );
              }
            ),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.red,
              child: const Text("Container 2"),
            ),
            Container(
              width: 100.0,
              height: double.infinity,
              color: Colors.blue,
              child: const Text("Container 3"),
            ),
          ],
        ),
      ),
    ),
  ));
}
