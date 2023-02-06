import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocityx/constants/controllers.dart';
import 'package:velocityx/controllers/app_controller.dart';


class LoginWidget extends StatelessWidget {
  final AppController _appController;
  LoginWidget( this._appController, { Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ([
        VxBox(
          child: 
          [
            // E Mail
            VxBox(
              child: VxBox(
                child: VxTextField(
                  borderType: VxTextFieldBorderType.none,
                  controller: authController.email,
                  fillColor: Colors.transparent,
                  icon: const Icon(Icons.mail_outline, color: Colors.blue),
                  labelText: "E mail",
                  labelStyle: const TextStyle(color: Colors.blue),
                )
              ).make().pOnly(left: 12)
            ).color(Vx.white.withOpacity(0.3)).roundedLg
            .make().w(context.percentWidth * 88).p16(),

            // Password
            VxBox(
              child: VxBox(
                child: VxTextField(
                  borderType: VxTextFieldBorderType.none,
                  fillColor: Colors.transparent,
                  icon: const Icon(Icons.lock_outline, color: Colors.blue),
                  controller: authController.password,
                  labelText: "Password",
                  labelStyle: const TextStyle(color: Colors.blue),
                  isPassword: true,
                  obscureText: true,
                )
              ).make().pOnly(left: 12),
            ).color(Vx.white.withOpacity(0.3)).roundedLg
            .make().w(context.percentWidth * 88).pOnly(left: 16, right: 16),

            // Login Button
            "Login".text.white.bold.xl.make().p20().px64().box.blue400.roundedLg.make().p16().onTap(() {
              //Get.to(HomePage_GetFinal());
              authController.signIn();
              //_appController.changeDisplayedAuthWidget();
            }),

            

          ].vStack()

      ).pink400.roundedLg.neumorphic(
        elevation: 1,
        curve: VxCurve.emboss,
      ).make(),

      // ----
      HeightBox(context.percentHeight * 2),

      // 
      [
        "Don't have an account ?   ".text.make(),
        "Get Account !".text.blue900.xl.bold.make().onTap(() {
          _appController.changeDisplayedAuthWidget();
        })
      ].hStack(
        alignment: MainAxisAlignment.end,
        crossAlignment: CrossAxisAlignment.end
      )

    ].vStack()
    );
  }
}


/*
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.pink,
boxShadow: [
  BoxShadow(
    color: Colors.grey.withOpacity(.5),
    blurRadius: 10,

  )
],
borderRadius: BorderRadius.circular(20)
      ),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                        icon: Icon(Icons.email_outlined),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Email"),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    controller: null,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: "Password"),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: VxBox(
                
                child: "Login".text.make()
            ).make(),
          )
        ],
      ),
    );
  }
}
*/

