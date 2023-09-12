import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

void main() {
  runApp(const BitcointTracker());
}

const List<String> currencyList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
];

const List<String> cryptos = [
  'BTC',
  'ETH',
  'LTC',
];

class BitcointTracker extends StatefulWidget {
  const BitcointTracker({super.key});

  @override
  State<BitcointTracker> createState() => _BitcointTrackerState();
}

class _BitcointTrackerState extends State<BitcointTracker> {
  String currentCurrency = "USD";
 
  String result = "?";


  void getCurrencyData() async
  {
    for(String i in cryptos)
    {
      String urlString = "https://rest.coinapi.io/v1/exchangerate/$i/$currentCurrency?apikey=1723BFFC-A31C-45ED-83CC-E637F1291E64";
      Uri uri = Uri.parse(urlString);
      http.Response rp = await http.get(uri);
      if(rp.statusCode == 200)
        {
          String data = rp.body;

          var decodedData = jsonDecode(data);

          result = decodedData["rate"].toString().split(".")[0];

        }
    }
    
    
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bitcoin Ticker!"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
          child: Container(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "1 BTC = $result $currentCurrency",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "1 ETH = $result $currentCurrency",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  color: Colors.blue,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "1 LTC = $result $currentCurrency",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
                    color: Colors.blue,
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: DropdownButton<String>(
                        style: TextStyle(color: Colors.white),
                        dropdownColor: Colors.black,
                        value: currentCurrency,
                        items: [
                         
                          for (int i = 0; i < currencyList.length; i++)
                            DropdownMenuItem(
                              child: Text(currencyList[i]),
                              value: currencyList[i],
                            )
                        ],
                        onChanged: (value) {
                          setState(() {
                            currentCurrency = value.toString();
                            getCurrencyData();
                          });
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
