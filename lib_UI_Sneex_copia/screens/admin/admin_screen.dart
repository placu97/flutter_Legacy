import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/screens/admin/widgets/create_dialog_widget.dart';
import 'package:firetest/screens/admin/widgets/update_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,// ** ?
        leading: IconButton(onPressed: () => Get.back(),
        icon: const Icon(Icons.chevron_left_outlined, size: 30)),
        title: const VxTwo(
            isHorizontal: true,
            title: "Sneex",
            titleFontSize: 24,
            subtitle: "ADMIN",
            isSubtitleBold: true,
            crossAxisAlignment: CrossAxisAlignment.end,
          )
      ),

      body: ListView(
        children: productsController.products
          .map((product) => ListTile(
          leading: Image.network(product.image),
          title: product.name.text.make(),
          subtitle: product.brand.text.make(),
          trailing: product.price.text.make(),
          onTap: () => showCupertinoDialog(
            context: context,
             builder: (context) => UpdateDialogWidget(product)),
        ).card.make()).toList()
      ),

      floatingActionButton: IconButton(
        icon: const Icon(Icons.add, color: Colors.black, size: 30),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => CreateDialogWidget()
          )
        ).p12().box.color(Colors.red).roundedFull.make(),
      );
  }
}