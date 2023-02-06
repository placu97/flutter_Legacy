import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:velocityx/models/device.dart';

import 'device_widget.dart';

class DevicesDraggable extends StatelessWidget {
  const DevicesDraggable({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return
        DraggableScrollableSheet(
            initialChildSize: .3,
            builder: (context, scrollable){
          return 
           [
            VxBox(
               child: 
                 ListView(
                 controller: scrollable,
                  children: [

                    VxBox().height(6).width(40).rounded.gray400.makeCentered().pOnly(top: 6),

                    DeviceWidget(device: DeviceModel(
                      name: "Samsung S20",
                      os: 'android'
                    ),),

                      DeviceWidget(device: DeviceModel(
                      name: "iPhone 12",
                      os: 'ios'
                    ),),
                    
                   ],
               )
             ).white.shadow.make(),

          ].stack();

          // Stack(
          //   children: [
          //     Container(

          //       decoration: BoxDecoration(color: Colors.blue,
          //           boxShadow: [
          //             BoxShadow(
          //                 color: Colors.grey.withOpacity(.8),
          //                 offset: Offset(3, 2),
          //                 blurRadius: 7)
          //           ]),
          //       child: 
          //       ListView(
          //         controller: scrollable,
          //         children: [

          //           Row(// drag
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Container(
          //                 margin: EdgeInsets.all(15),
          //                 height: 6,
          //                 width: 40,
          //                 decoration: BoxDecoration(
          //                 color: Colors.grey,
          //                 borderRadius: BorderRadius.circular(8)
          //                 ),
          //               ),
          //             ],
          //           ),
          //           Icon(Icons.ac_unit),
          //           Icon(Icons.ac_unit),
          //           Icon(Icons.ac_unit),
          //           Icon(Icons.ac_unit),
          //           Icon(Icons.ac_unit),
          //           // DeviceWidget(device: DeviceModel(
          //           //   name: "Samsung S20",
          //           //   os: 'android'
          //           // ),),

          //           //   DeviceWidget(device: DeviceModel(
          //           //   name: "iPhone 12",
          //           //   os: 'ios'
          //           // ),),
          //         ],
          //       ),
          //     ),
          //   ],
          // );
        }
      );
  }
}