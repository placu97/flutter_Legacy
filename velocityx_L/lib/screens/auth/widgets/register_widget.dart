import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:velocityx/constants/controllers.dart';
import 'package:velocityx/controllers/app_controller.dart';

class RegisterWidget extends StatelessWidget {
  AppController _appController;
  RegisterWidget(this._appController,{ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Container(
      child: [
          VxBox(
            child: 
            [
              // Name
              VxBox(
                child: VxBox(
                  child: VxTextField(
                    controller: authController.name,
                    borderType: VxTextFieldBorderType.none,
                    fillColor: Colors.transparent,
                    icon: const Icon(Icons.person_outline, color: Colors.blue),
                    labelText: "Name",
                    labelStyle: const TextStyle(color: Colors.blue),
                  )
                ).make().pOnly(left: 12)
              ).roundedLg.color(Vx.white.withOpacity(0.3))
              .make().w(context.percentWidth*88).p16(),
            
              // E mail
              VxBox(
                child: VxBox(
                  child: VxTextField(
                    controller: authController.email,
                    borderType: VxTextFieldBorderType.none,
                    fillColor: Colors.transparent,
                    icon: const Icon(Icons.mail_outline, color: Colors.blue),
                    labelText: "E mail",
                    labelStyle: const TextStyle(color: Colors.blue),
                  )
                ).make().pOnly(left: 12)
              ).roundedLg.color(Vx.white.withOpacity(0.3))
              .make().w(context.percentWidth*88).pOnly(bottom: 16),

              // Password
              VxBox(
                child: VxBox(
                  child: VxTextField(
                    controller: authController.password,
                    borderType: VxTextFieldBorderType.none,
                    fillColor: Colors.transparent,
                    icon: const Icon(Icons.lock_outline, color: Colors.blue),
                    labelText: "Password",
                    labelStyle: const TextStyle(color: Colors.blue),
                    isPassword: true,
                    obscureText: true,
                  )
                ).make().pOnly(left: 12)
              ).color(Vx.white.withOpacity(0.3)).roundedLg
            .make().w(context.percentWidth * 88),

              // Register Button
              "Register".text.white.xl.bold.make().p20().px64().box.roundedLg.blue700.make().p16().onTap(() {
                //_appController.changeDisplayedAuthWidget();
                authController.signUp();
              })

            ].vStack()
        ).pink400.roundedLg.neumorphic(
          elevation: 1,
          curve: VxCurve.emboss,
      ) .make(),

        // ---
        HeightBox(context.percentHeight*2),

        // Text *from Register* => to Login
        [
          "Already have an Account ?   ".text.make(),
          "Sign in !".text.xl.blue700.bold.make().onTap(() {
            _appController.changeDisplayedAuthWidget();
          })
        ].hStack()
      ].vStack()

    );
  }
}