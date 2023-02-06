import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:velocityx/controllers/app_controller.dart';
import 'package:velocityx/screens/auth/widgets/login_widget.dart';
import 'package:velocityx/screens/auth/widgets/register_widget.dart';

class LoginPage_GetFinal extends StatelessWidget {
  LoginPage_GetFinal({ Key key }) : super(key: key);
  
  final AppController _appController = Get.find();


@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx( () => SingleChildScrollView(
        child: Stack(
          children: [
            //  BG
            Image(
              image: NetworkImage("https://picsum.photos/${(context.width).round()}/${(context.height).round()}")),
              

            // VERTICAL
            // Container(
            //   width: context.width,
            //   height: context.height,
            //   child: 
              [
                //HeightBox(context.percentHeight * 45),
                // LAYOUT
                // Tutto il contesto all'ingresso
                // Login
                Visibility(
                  visible: _appController.isLoginWidgetDisplayed.value,
                  child: LoginWidget(_appController)
                ),

                // Register
                Visibility(
                  visible: ! _appController.isLoginWidgetDisplayed.value,
                  child: RegisterWidget(_appController)
                ),

                // ----
                HeightBox(context.percentHeight*20)


                // ---
                //HeightBox(context.percentHeight * 2),

                // Text below *whenLogin* => to Register
                // Visibility(
                //   visible: _appController.isLoginWidgetDisplayed.value,
                //   child: [
                //     "Don't have an Account?   ".text.make(),
                //     "Create Account !".text.bold.blue400.underline.xl.make()
                //     .box.transparent.make().onTap(() {
                //       _appController.changeDisplayedAuthWidget();
                //     })
                //   ].hStack(
                //     crossAlignment: CrossAxisAlignment.end
                //   )
                // ),

                // Text below *whenRegister* => to Login
                // Visibility(
                //   visible: ! _appController.isLoginWidgetDisplayed.value,
                //   child: [
                //     "Already have an Account?   ".text.make(),
                //     "Sign in !".text.bold.blue400.underline.xl.make()
                //     .box.transparent.make().onTap(() {
                //       _appController.changeDisplayedAuthWidget();
                //     })
                //   ].hStack(
                //     crossAlignment: CrossAxisAlignment.end
                //   )
                // ),

              ].vStack(
                alignment: MainAxisAlignment.end,
                //crossAlignment: CrossAxisAlignment.center,
              ).box.green400.size(context.width, context.height).make()
            //)

          ],
        ),
      )),
    );
  }
}

// @override
//   Widget build(BuildContext context) {
//     return Scaffold(// o Material to make VStack's alignments work
//       body: VStack(
//         [
//           "ciao".text.xl6.make()
//         ],
//         alignment: MainAxisAlignment.center,
//         crossAlignment: CrossAxisAlignment.center,
//       ),
//     );
//   }
// }