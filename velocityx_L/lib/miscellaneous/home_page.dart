import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: VxAppBar(

          title: "Pizza".text.orange100.xl3.make(),
        ),
        body: VStack([
          VxArc(
          arcType: VxArcType.CONVEX,
          height: context.percentHeight * 8,
          child: VxBox().size(context.screenWidth, context.percentHeight * 8).red500.make(),
        ),
        "ciao dave!".text.xl6.bold.yellow50.center.make()
        .box.orange100.p16.rounded.outerShadow3Xl
          .gradientFromTo(from: Vx.amber500, to: Vx.rose500)
          .sizePCT(context: context, widthPCT: 60.0, heightPCT: 20.0)
          .alignCenter
          .make().centered()
        ])
    );
  }
}
