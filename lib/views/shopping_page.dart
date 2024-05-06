import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_cart/controllers/cart_controller.dart';
import 'package:simple_cart/controllers/shopping_controller.dart';

class ShopingPage extends StatelessWidget {
  ShopingPage({super.key});
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index){
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(
                                        fontSize: 24
                                      ),
                                    ),
                                    Text(
                                      controller.products[index].productDescription,
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: const TextStyle(
                                    fontSize: 24
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: (){
                                cartController.addToCart(controller.products[index]);
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              ), 
                              child: const Text("Add to Cart"),
                            )
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text("Total Amount: \$ ${controller.totalPrice}",
                      style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white
                      ),
                );
              }
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(
          builder: (controller) {
            return Text(controller.count.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 24
              ),
            );
          }
        )),
    );
  }
}