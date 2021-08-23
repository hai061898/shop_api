import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  final box = GetStorage().obs;
  var authenicated = false.obs;

  login(username, password) {
    var user;
    user = box.value.read("user") ?? [];
    user = jsonDecode(user.toString());

    var index = -1;

     for (var i = 0; i < user.length; i++) {
      if (user[i]["username"] == username &&
          user[i]["password"] == password) {
        authenicated(true);
        index = i;
        break;
      }
    }
    if (index != -1)
      box.value.write("auth", authenicated.value ? user[index]["id"] : null);
    return authenicated.value;
  }

  register(username, password) {
    var users;
    users = box.value.read("users") ?? [];
    users = jsonDecode(users.toString());
    var user = {
      "id": users.length,
      "username": username,
      "password": password,
    };
    users.add(user);
    box.value.write("users", jsonEncode(users));
    box.value.write("auth", user["id"]);
    authenicated(true);
  }

   logout() {
    box.value.write("auth", null);
    authenicated(false);
  }
}
