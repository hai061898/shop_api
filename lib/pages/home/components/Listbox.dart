import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/home_Controller.dart';

class ListBoxCategory extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cloths",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_down),
                )
              ],
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              controller.toggGrid();
            },
            icon: Icon(Icons.filter_list)),
      ],
    );
  }
}
