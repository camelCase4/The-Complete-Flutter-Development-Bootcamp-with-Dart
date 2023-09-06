import 'package:flutter/material.dart';

class bCard extends StatelessWidget {
  const bCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage("images/diamond.png"),
            ),
            Text(
              "Roger Jay Sering",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            ),
            Text(
              "F L U T T E R  D E V E L O P E R",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10,
                color: Colors.white,
                fontFamily: 'Pacifico',
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.shopping_cart,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "+6 965 220 2568",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.teal,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "rogerjaysering@gmail.com",
                    style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'Pacifico',
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
