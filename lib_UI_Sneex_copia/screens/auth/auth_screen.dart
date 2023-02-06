import 'package:firetest/controllers/user_controller.dart';
import 'package:firetest/screens/auth/widgets/login_widget.dart';
import 'package:firetest/screens/auth/widgets/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  final UserController userController = Get.find();

@override
  Widget build(BuildContext context) {
  final isKeyboard = context.mediaQueryViewInsets.bottom == 0;
  final keyboardHeight = context.mediaQueryViewInsets.bottom ;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:Obx( () => [
        [
          // Logo
          if ( isKeyboard )
          Image.asset("assets/logo.png", width: context.percentWidth *80,),
          HeightBox(context.percentHeight *69)
        ].stack().centered(),
        [
          
          // ---
          if ( isKeyboard )
          HeightBox(context.percentHeight *15),
          // Login
          Visibility(
            child: LoginWidget(userController),
            visible: userController.isLoginWidgetDisplayed.value,
          ),
          // Register
          Visibility(
            child: RegisterWidget(userController),
            visible: ! userController.isLoginWidgetDisplayed.value,
          ),
          // ---
          isKeyboard ?
          HeightBox(context.percentHeight *20) : HeightBox(keyboardHeight+20)
        ].vStack(
          alignment: MainAxisAlignment.end // <---- *****
        ).box.size(context.width, context.height).make()
      ].stack()
    ));
  }
}