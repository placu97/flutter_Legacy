import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:velocityx/miscellaneous/model/counter_controller.dart';
import 'package:velocityx/miscellaneous/pages/other.dart';

class HomeGetScreen extends StatelessWidget {
  HomeGetScreen({ Key key }) : super(key: key);

  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          HeightBox(context.percentHeight*20),

          Obx(() => "Clicks:   ${counterController.counter.value}".text.lightBlue500.xl3.bold.makeCentered(), ),

          30.heightBox,

          VxBox(
            child: "Open Other Screen".text.white.semiBold.xl.make()
          ).purple400.rounded.p16.makeCentered().onInkTap(() {
            Get.to(OtherPage());
            counterController.counter.value++;
          })

        ]
      ) ,
    );
  }
}