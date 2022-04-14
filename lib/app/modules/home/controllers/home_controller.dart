import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:owl_flutter/app/modules/home/views/widgets/home_screen.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxString email = "".obs;
  RxString password = "".obs;
  RxBool rememberme = false.obs;
  RxInt nilai = 0.obs;
  RxBool secureText = true.obs;

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
      int value = hasil["value"];
      print(hasil);
      if (value == 1) {
        if (box.read("dataLogin") != null) {
          //hapus data storage
          box.remove("dataLogin");
        }
        if (rememberme.isTrue) {
          //kalau dichecklist simpan data ke get storage
          final box = GetStorage();
          box.write("dataLogin", {
            "email": email.value,
            "password": password.value,
            "rememberme": rememberme.value
          });
        }
        Get.toNamed("/homeScreen");
      } else {
        print("salah Username/Password");
      }
    } catch (err) {
      print(err);
    }
  }

  // void login() {
  //   //ini dummy data

  //   if (email.value == "a@gmail.com" && password.value == "a") {
  //     if (box.read("dataLogin") != null) {
  //       //hapus data storage
  //       box.remove("dataLogin");
  //     }
  //     if (rememberme.isTrue) {
  //       //kalau dichecklist simpan data ke get storage
  //       final box = GetStorage();
  //       box.write("dataLogin", {
  //         "email": email.value,
  //         "password": password.value,
  //         "rememberme": rememberme.value
  //       });
  //     }
  //     Get.toNamed("/homeScreen");
  //   } else {
  //     print("salah password");
  //   }
  // }

  void showHideText() {
    secureText.value = !secureText.value;
  }

  @override
  void onInit() {
    emailC = TextEditingController();
    passwordC = TextEditingController();

    // cekDataStorage();
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
