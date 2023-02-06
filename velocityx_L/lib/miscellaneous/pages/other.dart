import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:velocityx/miscellaneous/model/counter_controller.dart';

class OtherPage extends StatelessWidget {
  OtherPage({ Key key }) : super(key: key);

  final CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          HeightBox(context.percentHeight * 20),

          "Screen was clicked ${_counterController.counter.value} times!"
            .text.yellow500.bold.xl3.makeCentered(),

          30.heightBox,

          VxBox(
            child: "Return back".text.xl.semiBold.white.make()
          ).green400.rounded.p16.makeCentered().onInkTap(() {
            Get.back();
          })
        ]
      ),
    );
  }
}