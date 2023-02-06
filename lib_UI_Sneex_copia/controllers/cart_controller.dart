import 'package:firetest/controllers/controllers.dart';
import 'package:firetest/models/cart_item_model.dart';
import 'package:firetest/models/product_model.dart';
import 'package:firetest/models/user_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';


class CartController extends GetxController {
  static CartController cartController = Get.find();

  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice );
  }

  addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Check your cart", "${product.name} is already added", 
          duration: const Duration(milliseconds: 1500)
        );
      } else {
        // Biz Logic
        // Creo id
        String itemId = const Uuid().v1();
        userController.updateUserData({
          "cart" : FieldValue.arrayUnion([{
            "id": itemId,
            "productId" : product.id,
            "name" : product.name,
            "quantity" : 1,
            "price" : product.price,
            "image" : product.image,
            "cost" : product.price
          }])
        });

        // Snackbar
        Get.snackbar("Item added", "${product.name} was added to your cart",
          duration: const Duration(milliseconds: 1500)
        );
      }
    } catch(e) {
      print(e.toString());

    }
  }

  void decreaseQuantity(CartItemModel cartItem) {
    if (cartItem.quantity == 1) {
      _removeCartItem(cartItem);
    } else {
      _removeCartItem(cartItem);
      cartItem.quantity--;
      userController.updateUserData({
        "cart" : FieldValue.arrayUnion([cartItem.toJson()])
      });
    }
  }

  void increaseQuantity(CartItemModel cartItem) {
    _removeCartItem(cartItem);
    cartItem.quantity++;
    userController.updateUserData({
      "cart" : FieldValue.arrayUnion([cartItem.toJson()])
    });
  }


  void _removeCartItem(CartItemModel cartItem) {
    try {
      userController.updateUserData({
        "cart" : FieldValue.arrayRemove([cartItem.toJson()])
      });
    } catch(e) {
      print(e.toString());
      Get.snackbar("Error", "Cannot remove this item");
    }
  }

  void changeCartTotalPrice(UserModel userModel) {
    print("object");// perchè viene chiamato due volte
    totalCartPrice.value = 0.0;
    if (userModel.cart.isNotEmpty) {
      userModel.cart.forEach((cartItem) {
        totalCartPrice += cartItem.cost;
       });
    }
  }

  // Returns true if item has already been added
  bool _isItemAlreadyAdded(ProductModel product) =>
    userController.userModel.value.cart
    .where((item) => item.productId == product.id)
    .isNotEmpty;




}