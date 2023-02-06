//classe creata con generatore di classi (search in CMD + P)
class CartItemModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const QUANTITY = "quantity";
  static const COST = "cost";
  static const PRICE = "price";
  static const PRODUCT_ID = "productId";

  String id;
  String image;
  String name;
  int quantity;
  double cost;
  // Product-related Model
    String productId;
    double price;
  
  CartItemModel({this.productId, this.id, this.image, this.name, this.quantity, this.cost });

  // INterfacce con Database
    // FROM DB
  CartItemModel.fromMap(Map<String, dynamic> data) {
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    quantity = data[QUANTITY];
    cost = double.parse( data[COST].toString());//.toDouble();
    productId = data[PRODUCT_ID];
    price = double.parse( data[PRICE].toString());//.toDouble();
  }
    // TO DB
  Map toJson() => {
    ID: id,
    PRODUCT_ID: productId,
    IMAGE: image, 
    NAME: name,
    QUANTITY: quantity,
    COST: price * quantity,
    PRICE: price
  };
}