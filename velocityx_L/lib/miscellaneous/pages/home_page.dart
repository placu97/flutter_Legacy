import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocityx/miscellaneous/model/radio.dart';
import 'package:velocityx/miscellaneous/utils/ai_util.dart';

class HomePageAI extends StatefulWidget{
  @override
  _HomePageAIState createState() => _HomePageAIState();
}

class _HomePageAIState extends State<HomePageAI> {
  // VARs
  List<MyRadio> radios;
  var isInitialized = false;

  MyRadio _selectedRadio;
  Color _selectedColor;
  bool _isPlaying = false;
  final sugg = [
    "Play",
    "Stop",
    "Play rock music",
    "Play next",
    "Play 107 FM",
    "Pause",
    "Play previous",
    "Play pop music"
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  // METHDs
  @override
  void initState() {
    super.initState();
    //print("1");
    fetchRadios();

    _audioPlayer.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.STOPPED) {
        _isPlaying = true;
      } else if (event == PlayerState.PLAYING) {
        _isPlaying = false;
      }
      setState(() {
        
      });
        print(_isPlaying);
    });
  }

  fetchRadios() async {
    final radioJson =  await rootBundle.loadString("assets/radio.json");
    radios = MyRadioList.fromJson(radioJson).radios;
    isInitialized = true;
    //print(_selectedRadio.name);
    //print("2");
    setState(() {
      
    });
    _selectedRadio = radios[0];
  }

  _playMusic(String url) {
    _audioPlayer.play(url);
    _selectedRadio = radios.firstWhere((element) => element.url == url);
    //print(_selectedRadio.name);
    setState(() {
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: AIColors.primaryColor1,
          child: radios != null ? VStack([
            HeightBox(context.percentHeight *6),

            "All channels".text.white.xl2.semiBold.make().centered().p16(),

            HeightBox(context.percentHeight * 1),

            ListView(
              padding: Vx.m0,
              shrinkWrap: true,
              children: radios.map((e) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(e.icon)
                ),
                title: "${e.name} FM".text.white.xl.make(),
                subtitle: e.tagline.text.white.make(),
              ) ).toList(),
            ).expand()

          ]) : const Offstage() ,
        ),
      ),
      body: Stack(
        children: [

          VxAnimatedBox().size(context.screenWidth, context.screenHeight)
          .withGradient(LinearGradient(colors: [
            AIColors.primaryColor1,
            _selectedColor ?? AIColors.primaryColor2
          ],begin: Alignment.topLeft, end: Alignment.bottomRight ))
          .make(),

          [
            AppBar(
            title: "AI Radio".text.xl4.white.make(),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Builder(
              builder: (context) => const Icon(
                Icons.menu_outlined, color: Colors.white,  ).onInkTap(() {
              Scaffold.of(context).openDrawer();
            })
              ,),
            
            centerTitle: true,
            ).wFull(context).h10(context),

            20.heightBox,

            "Start with - Hey Alan 👇".text.white.xl.italic.semiBold.make(),

            20.heightBox,

            VxSwiper.builder(
              itemCount: sugg.length,
              height: 50,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              viewportFraction: 0.38,
              autoPlayCurve: Curves.linear,
              enableInfiniteScroll: true,
              itemBuilder: (context, index) {
                final s = sugg[index];
                return Chip(
                  label: s.text.make(),
                  backgroundColor: Vx.randomColor,
                );
              })

          ].vStack(),

          isInitialized ?
          VxSwiper.builder(
            itemCount: radios.length,
            enlargeCenterPage: true,
            aspectRatio: context.mdDeviceSize == MobileDeviceSize.small? 1.0 :
              context.mdDeviceSize == MobileDeviceSize.medium ? 1.0 : 
              2.0 ,
            // onPageChanged: (index) {
            //   final colorHex = radios[index].color;
            //   _selectedColor = Color(int.tryParse(colorHex));
            //   setState(() {
                
            //   });
            //},
            itemBuilder: (context, index) {
              //print("*****");
              final rad = radios[index];
              return VxBox(
                child: ZStack([

                  Positioned(
                    top: 0,
                    right: 0,
                    child: VxBox(
                      child: rad.category.text.white.uppercase.make().px16()
                    ).black.alignCenter.height(40).withRounded(value: 10).make(),
                  ),
                  
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: VStack([
                      rad.name.text.white.xl3.make(),
                      5.heightBox,
                      rad.tagline.text.white.sm.semiBold.make()],
                      crossAlignment: CrossAxisAlignment.center,
                      ) ,
                  ),

                  Align(
                    alignment: Alignment.center,
                    child: VStack([
                      const Icon(CupertinoIcons.play_circle, color: Colors.white,),
                      10.heightBox,
                      "Double tap to play".text.gray300.make()
                    ],crossAlignment: CrossAxisAlignment.center,),
                  )
                  
                ],),
              ).clip(Clip.antiAlias)
               .bgImage(DecorationImage(
                image: NetworkImage(rad.image),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken
                  ))).withRounded(value: 60).border(width: 5)
                  .make().p16().expand().onInkDoubleTap(() {
                    _playMusic(rad.url);
                    //print(rad.name);
                  });

          }) : Container(
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),

          isInitialized ?
          Align(
            alignment: Alignment.bottomCenter,
            child: [

              "Now playing - ${_selectedRadio.name} ${_isPlaying} FM".text.makeCentered(),

              Icon(_isPlaying? CupertinoIcons.stop_circle: CupertinoIcons.play_circle,
              color: Colors.white,
              size: context.percentWidth * 20).onInkTap(() {
                //print(_isPlaying);
                if (_isPlaying) {
                  //_audioPlayer.stop();
                  _audioPlayer.stop();
                } else {
                  _audioPlayer.play(_selectedRadio.url);
                }
              }),

            ].vStack()
          ).pOnly(bottom: context.safePercentHeight * 12) : Container()

        ],
        fit: StackFit.expand,
      ),
    );
  }
}