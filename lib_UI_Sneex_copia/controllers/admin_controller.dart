import 'package:firetest/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AdminController extends GetxController {
  static AdminController adminController = Get.find();
  
  Rx<String> name = "".obs;
  Rx<String> brand = "".obs;
  Rx<String> price = "".obs;
  //TextEditingController brand = TextEditingController();
  //TextEditingController price = TextEditingController();

  // Update Button pressed => fireStore.update
  s() {
    print(name);
  }

}