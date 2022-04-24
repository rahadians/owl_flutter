import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupController extends GetxController {
  RxString userName = "".obs;
  RxString email = "".obs;
  RxString password = "".obs;
  RxBool rememberme = false.obs;
  RxInt nilai = 0.obs;
  RxBool secureText = true.obs;
  RxString title = "".obs;

  RxString content = "".obs;
  RxString description = "".obs;
  RxString idUser = "".obs;

  TextEditingController userNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  void register() async {
    Uri url = Uri.parse("https://flutter.ramarumah.id/register.php");
    try {
      final Response = await http.post(
        url,
        body: {
          "username": userName.value,
          "email": email.value,
          "password": password.value,
          // "content-type": "application/x-www-form-urlencoded",
        },
        headers: {
          // "content-type": "form-data",
          "content-type": "application/x-www-form-urlencoded",
        },
      );

      print((Response != null) ? "ada data" : "tidak ada data");
      var hasil = json.decode(Response.body) as Map<String, dynamic>;

      print(hasil);
      int value = hasil["value"];
      if (value == 1) {
        Get.defaultDialog(
            title: "Register",
            middleText: "Register Berhasil Ditambahkan",
            onConfirm: () {
              Get.back();
              Get.back();
            });
      }
    } catch (err) {
      print(err);
    }
  }

  void showHideText() {
    secureText.value = !secureText.value;
  }
}
