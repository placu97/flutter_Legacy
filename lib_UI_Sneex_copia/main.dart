import 'package:firetest/controllers/admin_controller.dart';
import 'package:firetest/controllers/cart_controller.dart';
import 'package:firetest/controllers/payment_controller.dart';
import 'package:firetest/controllers/products_controller.dart';
import 'package:firetest/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'constants/firebase.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await fireInit.then((value) {
    Get.put(UserController());
    Get.put(CartController());
    Get.put(ProductsController());
    Get.put(AdminController());
    Get.put(PaymentController());
  });
  // TODO: implement AppCheck !!!
  // TODO: finish ADMIN
  // TODO: DB Rules
  // TODO: Mails at the end of the purchasing

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Firetest Demo",
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: SplashScreen(),
    );
  }
}


class SplashScreen extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: [
       
      Image.asset("assets/logo.png",width: context.percentWidth *80, fit: BoxFit.contain, ),
      //Image.network("vhttps://picsum.photos/200",width: 200, height: 200,)
      HeightBox(context.percentHeight *5),
      // TODO: uncomment for Waiting Spinnin
      // const SpinKitSpinningLines(
      //   color: Colors.black,
      // )
      
      ].vStack().centered(),
    );
  }
}












// -----------------------------------------------
// *****  
// Firebase test project "firetestyoo"
// composed of plenty Flutter default start projec
// Plus integration with Firebase     
// *****
// -----------------------------------------------

// import 'dart:math';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   runApp( MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key key}) : super(key: key);
//   final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: FutureBuilder(
//         future: _fbApp,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             print("You have an error! ${snapshot.error.toString()}");
//             return const Text("Something went wrong!");
//           } else if (snapshot.hasData) {
//              print("ok");
//              return const MyHomePage(title: 'Demo Home Page');
//           } else {
//             return const CircularProgressIndicator();
//           }
//         }, )
      
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     DatabaseReference _testRef = FirebaseDatabase(databaseURL: "https://firetestyoo-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("tefffst");
//     _testRef.set("Hello world N. ${Random().nextInt(100)} !");
//     DatabaseReference _ttestRef = FirebaseDatabase(databaseURL: "https://firetestyoo-default-rtdb.europe-west1.firebasedatabase.app/").reference().child("test");
//     _ttestRef.set("Hello world N. ${Random().nextInt(100)} !");
//     //print(_testRef);
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }



// db safety rules TODO
// 