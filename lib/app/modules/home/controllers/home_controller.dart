import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:owl_flutter/app/modules/home/views/home_screen.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxString email = "".obs;
  RxString password = "".obs;

  late TextEditingController emailC;
  late TextEditingController passwordC;

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

  @override
  void onInit() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
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
