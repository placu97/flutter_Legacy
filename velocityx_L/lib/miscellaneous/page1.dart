import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';


class Page1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Material(
      color: Vx.blueGray500,
      child: "hioooooo".text.orange300.xl4.bold.underline.make().p16()
      .card.p16.purple900.roundedLg.make().onTap(moveToPage2(context)).centered(),
      
    ));
  }

  moveToPage2( BuildContext context ) async {

    await context.vxNav.push(Uri(path: '/2'));
  }
}
