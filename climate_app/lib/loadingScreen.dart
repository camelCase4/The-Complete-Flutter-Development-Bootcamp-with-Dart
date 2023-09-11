import 'dart:convert';

import 'package:climate_app/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiK = 'e1b4e20d2e81bd0bcb6673a5f06eaa03';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;
  bool isLoading = false;
 

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

   setState(() {
     isLoading = true;
   });

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    print(latitude);
    print(longitude);
    getData();
   setState(() {
     isLoading = false;
   });
  }

  void getData() async {
    String urlString =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiK';
    Uri uri = Uri.parse(urlString);
    http.Response rp = await http.get(uri);

    if (rp.statusCode == 200) {
      String data = rp.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityname = decodedData['name'];

      print(temperature);
      print(condition);
      print(cityname);

      

       Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeDash(city: cityname, temp: temperature.toInt());
                      },
                    ),
                  );
    } else {
      print("error");
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bgimage.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black12,
                ),
                onPressed: () {
                  getLocation();
                  
                  
                  //SpinKitChasingDots(color: Colors.white,size: 100.0,);
                  
                },
                child: const Text(
                  
                  "Where am I?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
             if(isLoading)
              SpinKitChasingDots(
                color: Colors.white,
                size: 100.0,
              ),
              
             
             
            ],
          ),
        ),
      ),
    );
  }
}
