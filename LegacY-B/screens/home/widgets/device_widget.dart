import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:velocityx/models/device.dart';
import 'package:velocityx/constants/controllers.dart';
import 'single_device_draggable.dart';

class DeviceWidget extends StatelessWidget {
  final DeviceModel device;
  const DeviceWidget({this.device, Key key}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        appController.changeActiveDeviceTo(device);
        appController.changeActiveDraggableWidgetTo(SingleDeviceDraggable());
        print("ok");
      },
      leading: device.os == "ios" ? Icon(Icons.app_settings_alt_outlined) : Icon(Icons.android_outlined),

      title: device.name.text.make(),
      //  CustomText(
      //   text: device.name,
      //   size: 18,
      //   weight: FontWeight.bold,
      // ),
      subtitle: "Last log 2 days ago".text.make()
      // CustomText(
      //   text: "Last log 2 days ago",
      //   color: Colors.grey,
      // ),
    );
  }
}