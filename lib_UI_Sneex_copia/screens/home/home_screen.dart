import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/screens/admin/admin_screen.dart';
import 'package:firetest/screens/home/widgets/shoppingCart_ModalBottomSheet.dart';
import 'package:firetest/screens/home/widgets/products_screen.dart';
import 'package:firetest/screens/payments/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({ Key key }) : super(key: key);
  

@override
final bool isAdmin = userController.isAdmin.value;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isAdmin ? Colors.red : Colors.white,
        foregroundColor: Colors.black,// ** ?
        title: isAdmin?
          const VxTwo(
            isHorizontal: true,
            title: "Sneex",
            titleFontSize: 24,
            subtitle: "ADMIN",
            isSubtitleBold: true,
            crossAxisAlignment: CrossAxisAlignment.end,
          )
        : "Sneex".text.size(24).bold.make(),
        centerTitle: true,
        elevation: 0,
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     icon: Icon(Icons.show_chart_sharp),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () { showBarModalBottomSheet(
              context: context, 
              builder: (context) => Container(
                color: Colors.white,
                child: ShoppingCart_ModalBottomSheet(),// *** TODO
              ));}
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Obx( () => UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.black
              ),
              accountName: userController.userModel.value.name
                .text.white.bold.make() ?? "", 
              accountEmail: userController.userModel.value.email
                .text.white.make() ?? "" ) ),
            
            ListTile(
              leading: const Icon(Icons.book, color: Colors.black),
              title: "Payment History".text.make(),
              onTap: () => Get.to( () => PaymentScreen())
            ),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.black),
              title: "Log out".text.make(),
              onTap: () => userController.signOut(),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white30,
        child: ProductsScreen(),
      ),
      floatingActionButton: isAdmin ?
      IconButton(
        onPressed: () => Get.to(() => AdminScreen(), ) ,
        color: Colors.red,
        icon: const Icon(Icons.menu_book , color: Colors.black,)
      ).p12().box.color(Colors.red).roundedFull.make()
      : null,
    );
  }
}