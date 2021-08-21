import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/cart_controller.dart';
import 'package:shop/pages/cart/components/bottom_cart.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: buildAppBar(),
      body: Obx(() {
        if (controller.loading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.cartItems.isEmpty) {
          return Center(child: Text("No cart items found!"));
        }
        return Stack(
          children: [
            Container(),
            Positioned.fill(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: controller.cartItems.length,
                itemBuilder: (context, index) => Card(
                  elevation: 0,
                  child: Container(
                      height: 110,
                      padding: const EdgeInsets.all(8.0),
                      width: 100,
                      margin: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(controller.cartItems[index]
                                  ["product"]["image"]),
                            )),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.cartItems[index]["product"]
                                        ["title"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.cartItems[index]["product"]
                                          ["description"],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    "\$${controller.cartItems[index]["product"]["price"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                color: Colors.grey[200],
                                child: Icon(Icons.remove),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: Text(controller.cartItems[index]
                                        ["quantity"]
                                    .toString()),
                              ),
                              Container(
                                color: Colors.grey[200],
                                child: Icon(Icons.add),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
              ),
            ),
            BottomCart(),
          ],
        );
      }),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Cart",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined)),
      ],
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
