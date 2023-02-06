import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Page2 extends StatelessWidget{

  //const Page2( {Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Vx.emerald300,
        child: "ciaooooooo".text.purple900.xl6.bold.center.make(),
      )
    );
  }
}