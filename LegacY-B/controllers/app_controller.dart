import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/screens/home/widgets/devices_draggable.dart';
import 'package:velocityx/models/device.dart';

class AppController extends GetxController {
  static AppController appController = Get.find();
  RxBool isLoginWidgetDisplayed = true.obs;
  Rx<Widget> activeDraggableWidget = Rx<Widget>(DevicesDraggable());
  Rx<DeviceModel> activeDevice = DeviceModel().obs;
  
  changeDisplayedAuthWidget() {
    isLoginWidgetDisplayed.value = ! isLoginWidgetDisplayed.value;
  }

  changeActiveDeviceTo(DeviceModel device){
    activeDevice.value = device;
  }

   changeActiveDraggableWidgetTo(Widget widget){
    activeDraggableWidget.value = widget;
  }

}