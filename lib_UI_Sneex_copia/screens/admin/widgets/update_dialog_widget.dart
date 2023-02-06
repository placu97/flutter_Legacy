import 'package:firetest/constants/firebase.dart';
import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class UpdateDialogWidget extends StatelessWidget {
  final ProductModel product;
  const UpdateDialogWidget(this.product,{ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    String sName = product.name;
    String sBrand = product.brand;
    String sPrice = product.price.toString();
    return SimpleDialog(
      children: [
        VxBox(
          child: [
            // Name
            "Name".text.xl.semiBold.make().px4(),
            TextFormField(
              initialValue: sName,
              // implement udating in admin controller
              onChanged: (newName) {
                adminController.name.value = newName;
                adminController.s();
              },
            ).px8(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Colors.red,
            ).px8(),

            // Brand
            "Brand".text.xl.semiBold.make().px4(),
            TextFormField(
              initialValue: sBrand,
              // implement udating in admin controller
              onChanged: (newBrand) {
                adminController.brand.value = newBrand;
              },
            ).px8(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Colors.red,
            ).px8(),

            // Price
            "Price".text.xl.semiBold.make().px4(),
            TextFormField(
              keyboardType: TextInputType.number,
              initialValue: sPrice,
              // implement udating in admin controller
              onChanged: (newPrice) {
                adminController.price.value = newPrice;
                // TODO: fix lenght decimals to 2 in () => to fireStore *?
              },
            ).px8(),
            const Divider(
              height: 20,
              thickness: 5,
              color: Colors.red,
            ).px8(),

            // Buttons
            [
              // Save Button
              TextButton(
                onPressed: () {
                  fireStore.collection("products")
                  .doc(product.id)
                  .update({
                    'brand' : adminController.brand.value,
                    'name' : adminController.name.value,
                    'price' : adminController.price.value
                  }).catchError((e) {
                    Get.snackbar("Error", "Error updating fields");
                    print(e.toString());
                    print(product.id);
                  });
                },
                child: "SAVE".text.white.make().p8().px4()
                  .box.color(Colors.red).roundedLg.make()
              ).expand(),
              // Cancel Button
              TextButton(
                onPressed: () => Get.back(),
                child: "Cancel".text.white.make().p8()
                  .box.color(Colors.red).roundedLg.make()
              ).expand()
            ].hStack(
              alignment: MainAxisAlignment.spaceBetween
            ).centered(),
          // *** END ***
          ].vStack(
            crossAlignment: CrossAxisAlignment.start
          )
        ).width(context.percentWidth*90).make()
        ],
    );
    
    
    // return AlertDialog(
    //   // shape:
    //     //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     title: Text('Update Info'),
    //     content: [
    //       Text('Test'),
    //       TextFormField(
    //         initialValue: sName,
    //         // implement udating in admin controller
    //         onChanged: (sName) {adminController.name.value = sName; adminController.s();},
    //       )
    //     ].vStack(crossAlignment: CrossAxisAlignment.start),
    //     actions: [
    //       TextButton(
    //           onPressed: () => Get.back(),
    //           child: Text('OK'),),
    //       TextButton(
    //           onPressed: () => Get.back(),
    //           child: Text('Cancel'))
    //     ],
    // );
  }
}