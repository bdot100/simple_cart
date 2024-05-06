import 'package:get/get.dart';
import 'package:simple_cart/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(
        id: 1, 
        productName: 'FirstProd', 
        productImage: 'abd', 
        productDescription: "This is some description about the product", 
        price: 30
      ),
      Product(
        id: 2, 
        productName: 'SecProd', 
        productImage: 'abd', 
        productDescription: "This is some description about the product", 
        price: 40
      ),
      Product(
        id: 3, 
        productName: 'ThirdProd', 
        productImage: 'abd', 
        productDescription: "This is some description about the product", 
        price: 49.5
      ),
    ];

    products.value = productResult;
  }
}