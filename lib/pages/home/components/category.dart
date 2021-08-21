import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/category_controller.dart';

class CategoryList extends StatelessWidget {
  final CategoriesController categoryController =
      Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
        itemCount: categoryController.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Obx(
          () => InkWell(
            onTap: () {
              categoryController.changeCategories(index);
            },
            child: Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: index == categoryController.currentIndex.value ? Colors.black87 : Colors.transparent,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
               categoryController.categories[index],
                style: TextStyle(
                  color: index == categoryController.currentIndex.value? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
