import 'package:dio/dio.dart';
import 'package:firetest/constants/firebase.dart';
import 'package:firetest/constants/show_loading.dart';
import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/payment_model.dart';
import 'package:firetest/screens/payments/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:uuid/uuid.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  static PaymentController paymentController = Get.find();

  List<PaymentModel> payments = [];
  // Collection "payments"

  @override
  void onReady() async {
    super.onReady();
    // TODO: Scorporare PublicKey da qualsivoglia client
    // Stripe.publishableKey =
    //   'pk_test_51KE9JHAwt1N80TMUUOz7UkWtlbzOffQSDiU3EC20DSRbsx0uK4GYLkTYYUxwwisBLxajrTsmvoqWbyC5Qzk3OING00NwTM9apc';
    //   await Stripe.instance.applySettings();//***** */
  }

  getPaymentHistory() {
    showLoading();
    payments.clear();
    fireStore.collection("payments")
    .where("clientId", isEqualTo: userController.userModel.value.id)
    .get()
    .then((snapshot) {
      snapshot.docs.forEach((doc) {
        PaymentModel payment = PaymentModel.fromMap(doc.data());
        payments.add(payment);
      });

      dismissLoadingWidget();
      Get.to( () => PaymentScreen());
    }); 
  }

   
  void _showPaymentFailedAlert() {
      Get.defaultDialog(
        content: "Payment Failed. Try another card".text.make(),
        actions: [
          GestureDetector(//// *****
            child: "Okay".text.make().p8(),
            onTap: () => Get.back(),
          )
        ]
      );
    }

  _addToCollection ({String paymentStatus, String paymentId}) {
      String uuid = Uuid().v1();
      fireStore.collection("payments").doc(uuid).set({
        "id" : uuid,
        "clientId" : userController.userModel.value.id,
        "status" : paymentStatus,
        "paymentId" : paymentId,
        "cart" : userController.userModel.value.cartItemsToJson(),
        "amount" : cartController.totalCartPrice.value.toStringAsFixed(2),
        "createdAt" : DateTime.now().millisecondsSinceEpoch,
      });
      // Remove all items from cart
      userController.userModel.value.cart.clear();
  }
    

    
  
}