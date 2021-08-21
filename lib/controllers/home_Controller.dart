import 'package:get/get.dart';
import 'package:shop/api/product_api.dart';

class HomeController extends GetxController {
  ProductApi productApi = ProductApi();
  RxBool loading = false.obs;
  List products = [].obs;
  var showGrid = false.obs;


  loadProduct(String categoryName) async {
    loading(true);
    products = await productApi.loadProduct(categoryName);
    loading(false);
  }

  toggGrid() {
    showGrid(!showGrid.value);
  }
}
