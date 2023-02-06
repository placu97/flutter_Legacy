import 'package:firetest/models/payment_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get/get.dart';

class PaymentWidget extends StatelessWidget {
  PaymentModel paymentModel;
  PaymentWidget({this.paymentModel, Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return VxBox(
      child: [
        [
          "ITEMS: ".text.gray400.make(),
          
          "3".text.bold.size(16).make(),
          
          VxBox().make().expand(),

          "\$1k".text.size(18).bold.make().p8().pOnly(right: 10),
        ].hStack(),

        // ---
        const Divider(),

        ListTile(
          title: "['name']".text.gray400.make(),
          trailing: "\$180".text.gray400.size(16).make(),
        ),

        // ---
        const Divider(),

        ListTile(
          title: _returnDate().text.gray400.size(16).make() ,
          trailing: paymentModel.status.text.gray400.size(16).make(),
          //onTap: () => print(_returnDate()),
        )

      ].vStack()

    ).p12.shadowSm.white.withRounded(value: 10).make();
  }

  // Private Method
  String _returnDate() {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(paymentModel.createdAt);
    //timeago.setLocaleMessages("it_short", timeago.ItShortMessages());
    return timeago.format(date, locale: "it");
  }
}