import 'package:climate_app/searchDash.dart';
import 'package:flutter/material.dart';

class HomeDash extends StatelessWidget {
  final String city;
  final int temp;

  const HomeDash({super.key, required this.city, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/bgimage.jpg'),
          fit: BoxFit.fill,
        )),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.route,
                    color: Colors.white,
                    size: 50,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SearchPage();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 180,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "37",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Temp in $city today is $temp ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
