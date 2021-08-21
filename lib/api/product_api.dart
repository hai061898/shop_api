import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductApi {
  var url = "https://fakestoreapi.com/products";
  loadProduct() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
}
