import 'package:flutter/material.dart';
import 'package:i_am_rich_app/main.dart';

class PoorMe extends StatefulWidget {
  const PoorMe({super.key});

  @override
  State<PoorMe> createState() => _PoorMeState();
}

class _PoorMeState extends State<PoorMe> {
  String _upperTitle = "I Am Poor";
  String _btnName = "Revert";

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(  
          title: 
             Text(_upperTitle),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        backgroundColor: Colors.green,
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return const MyWidget();
                          },
                        ),
                      );
                    },
                    child: const Image(
                      image: AssetImage(
                        'images/icons8-coal-80.png',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (_upperTitle == "I Am Poor") {
                          _upperTitle = "I Am Coal!";
                          _btnName = "Revert";
                        } else {
                          _upperTitle = "I Am Poor";
                          _btnName = "What Am I?";
                        }
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.red,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(_btnName),
                )
              ],
            ),
          );
    
        }
      
    
  }

