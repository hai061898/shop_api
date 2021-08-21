import 'package:get/get.dart';
import 'package:shop/api/product_api.dart';

class HomeController extends GetxController {
  ProductApi productApi = ProductApi();
  RxBool loading = false.obs;
  List products = [].obs;
  var showGrid = false.obs;

  HomeController() {
    loadProduct();
  }

  loadProduct() async {
    loading(true);
    products = await productApi.loadProduct();
    loading(false);
  }

  toggGrid() {
    showGrid(!showGrid.value);
  }
}
