import 'package:flutter/material.dart';

class bCard extends StatelessWidget {
  const bCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 30,
              height: 30,
              child: const Image(
                image: AssetImage("images/diamond.png"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Roger Jay Sering",
            style:  TextStyle(
              
            ),
            ),
            
            const SizedBox(
              height: 10,
            ),
            Text("Flutter Developer"),
            
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 2,
              width: 500,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    color: Colors.white,
                    child: const Center(
                      child: Image(
                        image: AssetImage("images/diamond.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "+63 0965 220 2568",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                    color: Colors.white,
                    child: const Center(
                      child: Image(
                        image: AssetImage("images/diamond.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "rogerjaysering@gmail.com",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
