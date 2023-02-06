import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class CreateDialogWidget extends StatelessWidget {
  
  const CreateDialogWidget({ Key key }) : super(key: key);

@override
  Widget build(BuildContext context) {
    return AlertDialog(
      // shape:
        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text('Title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VxTextField(
              
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Get.back(),
              child: Text('OK'),),
          TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'))
        ],
    );
  }
}