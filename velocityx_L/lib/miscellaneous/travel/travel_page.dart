import 'dart:ffi';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget{

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {

  final usrUrl = "https://picsum.photos/200";
  final pic1Url = "https://picsum.photos/200/120";
  final pic2Url = "https://picsum.photos/200/120";

  double anim = 1.0;
  double anim2 = 1.0;

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    withAnimation(vsync: this, tween: Tween(begin: 1.0, end: 0.0), 
    callBack: (animationVal, controllerVal) {
      anim = animationVal as double;
      setState(() {});
    });

    withRepeatAnimation(vsync: this, tween: Tween(begin: 2.0, end: 3.0), 
    isRepeatReversed: true,
    callBack: (animationVal, controllerVal) {
      anim2 = animationVal as double;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = _tabController.index;

    return Scaffold(

      backgroundColor: Vx.purple500,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(14, 2).white.make()
        ]).pOnly(left: 16, top: 16),
      ),

      body: VStack([
        VxBox(
          child: [
            VxBox().sizePCT(context: context, widthPCT: 29, heightPCT: 29)
                .roundedFull.neumorphic(color: Vx.purple500, elevation: 30)
                .bgImage(DecorationImage(image: NetworkImage(usrUrl))).make().h15(context),

            "Hi, ".richText.withTextSpanChildren([
              "Matte".textSpan.bold.make()
            ]).white.xl2.make().p8().offset(offset: Offset(-300 * anim, 0)),
            // Heightbox mq %
            HeightBox(context.safePercentHeight * 1),

            VxTextField(
              borderType: VxTextFieldBorderType.none,
              borderRadius: 18,
              hint: "Search",
              autofocus: false,
              contentPaddingTop: 13,
              fillColor: Vx.gray100.withOpacity(0.3),
              prefixIcon: const Icon(Icons.search_outlined,color: Vx.white,),
            ).customTheme(themeData: ThemeData(
              brightness: Brightness.dark
            )).cornerRadius(10).p16()
          ].vStack()
        ).makeCentered().h32(context),

        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: VxBox(
            child: VStack([

              TabBar(
                controller: _tabController,
                indicatorColor: Colors.purple,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Vx.purple500,
                unselectedLabelColor: Vx.gray400,
                labelPadding: Vx.m16,
                tabs: [
                const Icon(Icons.map, size: 11, )
                  .scale(scaleValue: tabIndex == 0 ? anim2 : 3.0),
                const Icon(Icons.pin_drop, size: 11, )
                  .scale(scaleValue: tabIndex == 1 ? anim2 : 3.0),
                const Icon(Icons.restaurant, size: 11, )
                  .scale(scaleValue: tabIndex == 2 ? anim2 : 3.0),
                const Icon(Icons.person, size: 11, )
                  .scale(scaleValue: tabIndex == 3 ? anim2 : 3.0)
              ]).h(context.percentHeight * 7),

              TabBarView(
                controller: _tabController,
                children: ["1","2","3","4"].map((e) => VStack([
                  "Discover places in London".text.gray600.xl2.bold.make(),

                  20.heightBox,

                  HStack([
                    Image.network(pic1Url, fit: BoxFit.cover,).wh(context.percentWidth * 35, context.percentHeight * 13).cornerRadius(10),
                    
                    20.widthBox,
                    
                    VStack([
                      "Tower Bridge".text.semiBold.make(),
                      3.heightBox,
                      "Southwork".text.make().shimmer(),
                      [
                        VxRating(
                          size: 13,
                          onRatingUpdate: (value) {}, 
                        ),
                        5.widthBox,
                        "100".text.xs.gray600.make()
                      ].row(),
                    ],

                    crossAlignment: CrossAxisAlignment.start,

                    ).expand()
                  ]).cornerRadius(8).backgroundColor(Vx.gray200),

                ]).p16()
                ).toList(),
              ).expand(),

            ])
          ).white.make(),
        ).expand(),

      ]),
    );
    
  }
}