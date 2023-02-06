import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '/constants/controllers.dart';


class HomePage_GetFinal extends StatelessWidget {
  const HomePage_GetFinal({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: "Title".richText.black.xl2.bold.make(),
        iconTheme: const IconThemeData(
          color: Colors.black
        ),
      ),
      //∴

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: "Emmeee".text.make(),
               accountEmail: "emaiail@ecciù.gov".text.make()
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: "Log out".text.make(),
              onTap: () {
                authController.signOut();
              },
            ),
          ],
        ),
      ),

      backgroundColor: Colors.grey.shade300,

      body: Stack(
        children: [

          appController.activeDraggableWidget.value,

          VxBox(
            child: const Icon(Icons.map)
          ).white.p12.withRounded(value: 20).shadowXs.make().positioned(
            top: 10,
            right: 15
          ),
          
        ],
      ),
    );
  }
}