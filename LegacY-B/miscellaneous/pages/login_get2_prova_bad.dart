import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class HomePageGET2 extends StatelessWidget {
  const HomePageGET2({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ZStack(
        [
          // BG
           VxBox().sizePCT(context: context, widthPCT: 100, heightPCT: 100).blue100.make().positioned(),
          // VERTICAL
          VStack(
            [
              // space
              HeightBox(context.percentHeight * 33),
              // CENTER
              ZStack(
                [
                  VxBox().sizePCT(context: context, widthPCT: 90, heightPCT: 33)
                  .teal300.rounded.neumorphic(elevation: 2, curve: VxCurve.flat).makeCentered(),
                  // VxBox ? ??
                  VStack(
                    [
                      "ciao".text.makeCentered(),
                      20.heightBox,
                      const VxTextField(
                        icon: Icon(Icons.email_outlined,),
                        labelText: "Email",
                        fillColor: Colors.transparent,
                        cursorColor: Colors.pinkAccent,
                      ).p(2).box.orange50.withRounded(value: 45).clip(Clip.antiAlias).make().px(context.percentWidth * 10)
                    ]
                  )
                  
                ]
              )
            ]
          )

          
          
        ],
        alignment: AlignmentDirectional.topCenter,
      )
        
    );
  }
}