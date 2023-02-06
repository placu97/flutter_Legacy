import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firetest/models/cart_item_model.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";

  String id;
  String name;
  String email;
  List<CartItemModel> cart;

  UserModel({this.id, this.name, this.email, this.cart});

  // From DB
  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot[NAME];
    email = snapshot[EMAIL];
    id = snapshot[ID];
    cart = _convertCartItems(snapshot[CART] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFomDb){
    List<CartItemModel> _result = [];
    if(cartFomDb.isNotEmpty){
      cartFomDb.forEach((element) {
      _result.add(CartItemModel.fromMap(element));
    });
    }
    return _result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}