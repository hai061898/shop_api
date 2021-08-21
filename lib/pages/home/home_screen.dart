import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/category_controller.dart';

import 'package:shop/pages/cart/cart_screen.dart';
import 'package:shop/pages/home/components/Listbox.dart';
import 'package:shop/pages/home/components/category.dart';

class HomeScreen extends StatelessWidget {
  // final HomeController controller = Get.put(HomeController());
  final CategoriesController categorycontroller =
      Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Colors.grey.shade100,
      body: Obx(() {
        if(categorycontroller.loading.value){
          return Center(child: CircularProgressIndicator());
        }
        if(categorycontroller.categories.isEmpty){
           return Center(child: Text("No categories found"));
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListBoxCategory(),
              CategoryList(),
              Expanded(
                child: Obx(
                  () {
                    if (controller.loading.value) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (controller.products.isEmpty) {
                      return Center(child: Text("No products found"));
                    }
                    if (controller.showGrid.value)
                      return GridView.builder(
                        padding: EdgeInsets.only(top: 16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 0.0,
                            child: Container(
                              height: 150,
                              padding: EdgeInsets.all(16),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(controller
                                            .products[index]["image"]),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.products[index]["title"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Expanded(
                                            child: Text(
                                              controller.products[index]
                                                  ["description"],
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "\$${controller.products[index]["price"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    return buildProductsList();
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  ListView buildProductsList() {
    return ListView.builder(
      itemCount: controller.products.length,
      padding: EdgeInsets.only(top: 16),
      itemBuilder: (context, index) => Card(
        elevation: 0.0,
        child: Container(
          height: 120,
          padding: EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.products[index]["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.products[index]["title"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Expanded(
                        child: Text(
                          controller.products[index]["description"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "\$${controller.products[index]["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: BackButton(),
      elevation: 0,
      title: Text(
        "Shop",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartScreen(),
              ));
            },
            icon: Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
