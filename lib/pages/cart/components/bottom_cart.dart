import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/cart_controller.dart';

class BottomCart extends StatelessWidget {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16,
          bottom: 8.0,
          top: 4.0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Subtotal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "\$${controller.total}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Text(
                      "Subtotal does not include shipping",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16.0,
                      ),
                      primary: Colors.black,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Check out"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16.0,
                      ),
                      primary: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Check out with ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 4),
                        Container(
                          width: 60,
                          height: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://www.techrounder.com/wp-content/uploads/2019/08/paypal-logo.png")),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text("Continue shopping"),
          ],
        ),
      ),
    );
  }
}
