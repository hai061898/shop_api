import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesApi {
  var url = "https://fakestoreapi.com/products/categories";

  loadCategoriesApi() async {
    var response = await http.get(Uri.parse(url));
    var categoriesJson = json.decode(response.body);
    return categoriesJson;
  }
}