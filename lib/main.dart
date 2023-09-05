import 'package:flutter/material.dart';
import 'package:i_am_rich_app/i_am_poor.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  String _word = "I Am Rich";
  String _buttonName = "What Am I?";

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(_word),
          ),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const PoorMe();
                        },
                      ),
                    );
                  },
                  child: const Image(
                    image: AssetImage(
                      'images/diamond.png',
                    ),
                  ),
                ),

                const SizedBox(height: 20,),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(_word == "I Am Diamond")
                      {
                        _word = "I Am Rich";
                        _buttonName = "What Am I?";
                      }
                      else{
                        _word = "I Am Diamond";
                        _buttonName = "Revert";
                      }
                    });
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.red,
                    shape: const StadiumBorder(),
                  ),

                  child: Text(_buttonName),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
