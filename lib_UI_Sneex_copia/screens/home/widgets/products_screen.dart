import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/product_model.dart';
import 'package:firetest/screens/home/widgets/products_1_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Obx( () => GridView.count(// OBX *** ?
      crossAxisCount: 2,
      childAspectRatio: 0.63,
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 4,
      crossAxisSpacing: 10,
      physics: BouncingScrollPhysics(),
      children: productsController.products.map((product) { return ProductsOneWidget(product: product); print("ok"); }).toList()
      // [// * ?
      //   ProductsOneWidget(),
      //   ProductsOneWidget(),
      //   ProductsOneWidget(),
      //   ProductsOneWidget(),
      //   ProductsOneWidget(),
      //   ProductsOneWidget(),
      // ],
    ));
  }
}