import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/payment_model.dart';
import 'package:firetest/models/product_model.dart';
import 'package:firetest/screens/payments/widgets/payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.chevron_left),
        ),
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.1),
        title: "Payment History".text.size(24).bold.make(),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          paymentController.payments.map((payment) => PaymentWidget(paymentModel: payment,))
          .toList().vStack()
        ],
      ),
    );
  }
}