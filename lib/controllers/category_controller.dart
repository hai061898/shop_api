import 'package:get/get.dart';
import 'package:shop/api/category_api.dart';
import 'package:shop/controllers/home_Controller.dart';

HomeController controller = HomeController();

class CategoriesController extends GetxController {
  CategoriesApi categoriesApi = CategoriesApi();
  var categories = [].obs;
  var currentIndex = 0.obs;
  var loading = false.obs;

  CategoriesController() {
    loadCategories();
  }

  loadCategories() async {
    loading(true);
    var categoriesList = await categoriesApi.loadCategoriesApi();
    categories(categoriesList);

    if (categories.isNotEmpty) {
      await controller.loadProduct(categories[currentIndex.value]);
    }
     loading(false);
  }

  changeCategories(index) async {
    currentIndex(index);
    await controller.loadProduct(categories[index]);
  }
}
