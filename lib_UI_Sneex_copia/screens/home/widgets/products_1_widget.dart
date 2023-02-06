import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ProductsOneWidget extends StatelessWidget {
  final ProductModel product;
  const ProductsOneWidget({ this.product , Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return VxBox(
      child: [
        VxBox(
          child: 
          // Image
          Image.network(product.image),
          //Image.network("https://picsum.photos/200")
        ).topRounded(value: 20).clip(Clip.antiAlias).make().p8(),

        // Name
        product.name.text.bold.size(18).make(),
        //"ciao".text.bold.size(18).make(),

        // Brand
        product.brand.text.gray400.make(),
        //"marcha".text.gray400.make(),

        // ---
        5.heightBox,

        // Price
        [
          "\$${product.price}".text.ellipsis.bold.size(18).make().pOnly(left: 10),
          IconButton(
            onPressed: () { cartController.addProductToCart(product);},
            icon: const Icon(Icons.add_shopping_cart, color: Colors.black))
        ].hStack(alignment: MainAxisAlignment.spaceAround).box.width(context.width).make()
      ].vStack()
    ).white.roundedLg.clip(Clip.antiAlias).shadowSm.make();
  }
  
}