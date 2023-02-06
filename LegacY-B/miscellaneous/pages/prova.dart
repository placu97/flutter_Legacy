import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocityx/miscellaneous/model/radio.dart';
import 'package:velocityx/miscellaneous/utils/ai_util.dart';

class Prova extends StatefulWidget {
  const Prova({ Key key }) : super(key: key);

  @override
  _ProvaState createState() => _ProvaState();
}

class _ProvaState extends State<Prova> {

  List<MyRadio> radios;

  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson  = await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    print(radios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar NOT HERE
      // NEITHER BottomNavigationBar
      body: Stack(
        children: [

          // BACKGROUND
          VxAnimatedBox().size(context.screenWidth, context.screenHeight)
            .withGradient(LinearGradient(colors: [
              AIColors.primaryColor1,
              AIColors.primaryColor2
            ], begin: Alignment.topLeft, end: Alignment.bottomRight))
            .make(),

          // APPBAR
          AppBar(
            title: "TessSt AI Radio".text.white.xl4.bold.make(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: Icon(Icons.menu_outlined, color: Colors.white,),
          ).h10(context),

          // SWIPER
          radios != null ?
          VxSwiper.builder(
            itemCount: radios.length ,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
           itemBuilder: (context, index) {
             final rad = radios[index];

            return VxBox(
              child: ZStack([

                // Inner Swiper Top-Right
                Positioned(
                  top: 0,
                  right: 0,
                  child: VxBox(
                    child: rad.category.text.white.uppercase.make().px16()
                  ).height(40).black.alignCenter.withRounded(value: 10).make()
                ),

                //Inner Swiper Center
                Align(
                  alignment: Alignment.center,
                  child: [
                    Icon(CupertinoIcons.play_circle, color: Colors.white),
                    8.heightBox,
                    "Double tap to play".text.gray300.make()
                    ].vStack(),
                ),
                
                // Inner Swiper Bottom
                Align(
                  alignment: Alignment.bottomCenter,
                  child: VStack(
                    [
                      rad.name.text.xl3.white.bold.make(),
                      5.heightBox,
                      rad.tagline.text.white.semiBold.sm.make(),
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                ),

              ],)

            ).bgImage(DecorationImage(
              image: NetworkImage(rad.image),
              fit: BoxFit.cover ,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken)),)
             .withRounded(value: 60)
             .border(width: 5,)
             .clip(Clip.antiAlias)
             .make().p16();

           }).centered() : Center(child: CircularProgressIndicator(),) ,

          // BOTTOM NAVIGATION BAR
           BottomNavigationBar(
             
             items: [
               BottomNavigationBarItem(icon: Icon(Icons.access_alarm_outlined), label: "ciaone"),
               BottomNavigationBarItem(icon: Icon(Icons.celebration_outlined), label: "Ciao")
             ],
           ).h10(context).hide()

        ],

        fit: StackFit.expand,

      ),
      
    );
  }
}