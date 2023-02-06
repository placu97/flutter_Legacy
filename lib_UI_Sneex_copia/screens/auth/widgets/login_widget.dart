import 'package:firetest/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class LoginWidget extends StatelessWidget {
  final UserController userController;
  const LoginWidget(
    this.userController,
    { Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return [
      // Input Container
      VxBox(
        child: [
          // Email
          VxBox(
            child: VxTextField(
              fillColor: Colors.transparent,
              borderColor: Colors.transparent,
              icon: const Icon(Icons.email_outlined).pOnly(left: 10),
              labelText: "Email",
              controller: userController.email,
            ).pOnly(right: 5)
          ).gray100.roundedLg.make().pOnly(bottom: 12),

          // Password
          VxBox(
            child: VxTextField(
              fillColor: Colors.transparent,
              borderColor: Colors.transparent,
              icon: const Icon(Icons.lock_outline).pOnly(left: 10),
              labelText: "Password",
              isPassword: true,
              obscureText: true,
              controller: userController.passwd,
            ).pOnly(right: 5)
          ).gray100.roundedLg.make().pOnly(bottom: 12),

          // Login Button
          VxBox(
            child: "Login".text.xl.white.semiBold.make().px32()
          ).make().box.p20.black.roundedLg.make().onTap(() {
            userController.signIn();
          }),
        ].vStack()
      ).p12.white.rounded.shadowXs.make().p8(),// Input Container ends *****

      // ---
      HeightBox(context.percentHeight *5),

      // Text *toRegister*
      [
        "Don't have an account?  ".text.gray500.make(),
        "Get Account !".text.xl.semiBold.blue400.make().onTap(() {
          userController.changeLoginWidgetDisplayed();
        })
      ].hStack(
        crossAlignment: CrossAxisAlignment.end,
        //alignment: MainAxisAlignment.end
      )
    ].vStack();
  }
}