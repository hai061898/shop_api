import 'package:get/get.dart';
import 'package:shop/api/cart_api.dart';

class CartController extends GetxController {
  CartApi cartApi = CartApi();
  var cartItems = [];
  var loading = false.obs;
  var total = 0.0.obs;
  CartController() {
    loadCartApi();
  }

  loadCartApi() async {
    loading(true);
    var productList = await cartApi.loadCart();
    for (var i = 0; i < productList.length; i++) {
      var product = await cartApi.getProductId(productList[i]["productId"]);
      total(total.value + product["price"] * productList[i]["quantity"]);
      cartItems
          .add({"product": product, "quantity": productList[i]["quantity"]});
    }
    loading(false);
  }
}
