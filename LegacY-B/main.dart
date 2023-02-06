import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:velocityx/controllers/app_controller.dart';
import 'package:velocityx/controllers/auth_controller.dart';
import 'package:velocityx/miscellaneous/pages/homeGET.dart';
import 'package:velocityx/miscellaneous/pages/login_get2_prova_bad.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {

//You only need to call this method if you need the binding 
//to be initialized before calling runApp.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  
  Get.put(AuthController());
  Get.put(AppController());
  

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent
    )
  );

  runApp( MyApp() );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const Splash() //const  HomePageGET2()// HomeGetScreen(),//HomePageAI(),//Try()//
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue,
          color: Colors.black,
        ),
      ),
    );
  }
}

/*
.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: true,
      //home: Page1(),
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/1" : (_,__) => MaterialPage(child: Page1()),
        "/2" : (_,__) => MaterialPage(child: Page2()),
      } ),
      
    );
*/