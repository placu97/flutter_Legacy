import 'package:firetest/constants/firebase.dart';
import 'package:firetest/models/product_model.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  static ProductsController productsController = Get.find();

  RxList<ProductModel> products = RxList<ProductModel>([]);

  @override
  void onReady() {
    super.onReady();
    products.bindStream(_getAllProducts());
  }

  Stream<List<ProductModel>> _getAllProducts() =>
    fireStore.collection("products").snapshots()
      .map((query) => query.docs.map( (eachDoc) => ProductModel.fromMap(eachDoc.data())).toList());
  
}