import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(
    const XyloApp(),
  );
}

class XyloApp extends StatelessWidget {
  const XyloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                     AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/note1.wav"),
                          autoStart: true,
                          showNotification: true,
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.red,
                    ),
                  ),
                ),
                 Expanded(
                   child: GestureDetector(
                    onTap: (){
                      AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/note2.wav"),
                          autoStart: true,
                          showNotification: true,
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.orange,
                    ),
                                 ),
                 ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/note3.wav"),
                          autoStart: true,
                          showNotification: true,
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/note4.wav"),
                          autoStart: true,
                          showNotification: true,
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.green,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/note5.wav"),
                          autoStart: true,
                          showNotification: true,
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.blue.shade100,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/note6.wav"),
                          autoStart: true,
                          showNotification: true,
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      AssetsAudioPlayer.newPlayer().open(
                          Audio("assets/note7.wav"),
                          autoStart: true,
                          showNotification: true,
                      );
                    },
                    child: Container(
                      height: 100,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
