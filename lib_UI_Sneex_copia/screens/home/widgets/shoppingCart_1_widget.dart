import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ShoppingCartOneWidget extends StatelessWidget {
  final CartItemModel cartItem;
  const ShoppingCartOneWidget({this.cartItem, Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return [
      // Imagine
      Image.network(cartItem.image,width: 80,).p8(),
      //VxBox().size(80, 80).make().randomBox().p8(),
      
      Wrap(
        direction: Axis.vertical,
        //alignment: WrapAlignment.end,
        children: [
          // Name
          cartItem.name.text.semiBold.size(20).make().pOnly(left: 14),

          // Incre-Decre
          [
            IconButton(
              icon: const Icon(Icons.chevron_left, size: 35 ),
              onPressed: () => cartController.decreaseQuantity(cartItem)
            ),
            cartItem.quantity.text.semiBold.size(20).make(),
            IconButton(
              icon: const Icon(Icons.chevron_right, size: 35),
              onPressed: () => cartController.increaseQuantity(cartItem),
            ),
          ].hStack()
        ],
      ).expand(),

      // Prezzo
      "\$${cartItem.price}".text.size(22).bold.make().p(14)
    ].hStack();
  }
}