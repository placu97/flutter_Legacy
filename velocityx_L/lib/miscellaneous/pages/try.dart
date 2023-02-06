import 'package:audioplayers/audioplayers.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class Try extends StatefulWidget {
  const Try({ Key key }) : super(key: key);

  @override
  _TryState createState() => _TryState();
}

class _TryState extends State<Try> {

  var isPlaying = false;
  final AudioPlayer audio = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          VxBox(
         
          ).width(context.screenWidth).height(context.screenHeight).orange300.make(),

          Icon(isPlaying ? Icons.play_circle : Icons.stop_circle, size: 50, color: Colors.white,).onInkTap(() {
        if (isPlaying) {
          audio.stop();
          isPlaying = false;
          setState(() {
            
          });
        } else {
          audio.play("http://icecast.unitedradio.it/Virgin.mp3");
          isPlaying = true;
          setState(() {
            
          });
        }
      })

        ],
      )
    );
 
  }
}