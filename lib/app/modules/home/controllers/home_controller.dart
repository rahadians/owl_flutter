import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:owl_flutter/app/modules/home/views/home_screen.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxString email = "".obs;
  RxString password = "".obs;
  RxBool rememberMe = false.obs;

  late TextEditingController emailC;
  late TextEditingController passwordC;
  final box = GetStorage();

  void login() async {
    Uri url = Uri.parse("https://flutter.ramarumah.id/login.php");
    try {
      final Response = await http.post(
        url,
        body: {
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
      // int value = hasil["value"];
      int value = 1;
      print(value);
      if (value == 1) {
        print("ok");
        Get.toNamed("/homeScreen");
      } else {
        print("Gagal");
      }

      // var results = hasil['rajaongkir']['results'] as List<dynamic>;

      // var listAllHasilKurir = HasilOngkir.fromJsonList(results);
      // var courier = listAllHasilKurir[0];

    } catch (err) {
      print(err);
    }
  }

  void cekRemember() {
    if (rememberMe.isTrue) {
      box.write("storageLogin", {
        "email": email.value,
        "password": password.value,
        "rememberMe": rememberMe.value
      });
    } else {
      if (box.read('storageLogin') != null) {
        box.erase();
      }
    }
  }

  @override
  void onInit() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
    final dataLogin = GetStorage(); // instance of getStorage class
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
  }
}
