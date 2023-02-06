import 'dart:convert';
import 'dart:js';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firetest/constants/firebase.dart';
import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/screens/home/widgets/shoppingCart_1_widget.dart';
import 'package:firetest/screens/payments/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ShoppingCart_ModalBottomSheet extends StatelessWidget {
  const ShoppingCart_ModalBottomSheet({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return [
      
      // List of ShoppingCart
      ListView(
        children: [
          [
          10.heightBox,
          // Title
          "Shopping cart".text.bold.size(24).makeCentered(),
          5.heightBox,
          // Items
          // TODO: sistemare bug apparizione/scomparsa
          Obx( () =>  userController.userModel.value.cart.sortedBy((a, b) => a.name.compareTo(b.name))
              .map((cartItem) => ShoppingCartOneWidget(cartItem: cartItem,) ).toList().vStack()
          ),
          ].vStack()
          //VxBox().blue100.size(500, 500).make()
          // [
          // ShoppingCartOneWidget(),
          // ShoppingCartOneWidget(),
          // ShoppingCartOneWidget(),
          // ShoppingCartOneWidget(),
          // ].vStack()
        ],
      ),
      // Pay Button
      // Test
      
      // ElevatedButton(
      //   child: "ciao".text.make(),
      //   onPressed: null,
      // ).positioned(bottom: 10),
      Obx( () => "Pay (\$${cartController.totalCartPrice.value.toStringAsFixed(2)})".text.semiBold.size(22).white.make().p16().px(200)
        .box.black.roundedLg.makeCentered().box.width(context.width).make().onTap(() {
          sendPaymentDATA_toFirebaseFunctions_andInitPayment();
              //  var a= Get.defaultDialog(
              //   content: [ApplePayButton(),BackButton()].vStack()
              //  );
              
          
        }).positioned(bottom: 30),
      ),

      
      ].stack();
  }
}

Future<void> sendPaymentDATA_toFirebaseFunctions_andInitPayment() async {
  // productId : quantity
  var map = {};
  userController.userModel.value.cart.forEach((e) {
    map.addAll({
      // DATA
      e.productId : e.quantity
    });
  });
  // Print what's sent CLIENT ==> FIRESTORE
    //print(map);
            HttpsCallable callable = FirebaseFunctions.instanceFor(region: 'europe-west1').httpsCallable('createPaymentIntent');
            final resp = await callable.call(
              map
            ).catchError( (e) {
              print("Error in Firebase Fucntion: "+e);
            });
            
            List total = resp.data;
            Map stripeObj = total[2];
            //print(stripeObj['customerId']);
            print(total[2]);
            // 0 : totalCalculated ($$$ int)
            // 1 : public key
            // 2 : 
            // {
            // 	paymentIntent: paymentIntent,
            // 	ephemeralKey: ephemeralKey,
            // 	customer: stripeCustomerId,
            // 	success: true,
            // }
      
            if(total[2]['success'] == 'true'){
              Get.snackbar("Error", "Cannot provide payment details");
              return ;
            }
            Stripe.publishableKey = total[1];
            await Stripe.instance.applySettings();//***** */


            await Stripe.instance.initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: total[2]['paymentIntent'].toString(),
                merchantDisplayName: 'Sneex',
                customerId: total[2]['customer'].toString(),
                customerEphemeralKeySecret: total[2]['ephemeralKey'].toString(),
                merchantCountryCode: 'IT',
                testEnv: true,
                style: ThemeMode.dark
              )).catchError( (e) {
                print(e);
              });

              // Display Stripe PaymentSheet
              try {
                await Stripe.instance.presentPaymentSheet()
                .then((value) {
                  Future.delayed( const Duration(milliseconds: 500 )).then((value) { 
                    Get.back();
                  Get.snackbar("Payment Completed", "Success! You will recive an email with all the details");
    
                    });
                });
              }catch(e) {
                Get.snackbar("Payment has been canceled","");
              }
              
            
          }