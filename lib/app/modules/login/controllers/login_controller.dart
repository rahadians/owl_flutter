import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import 'package:image_picker/image_picker.dart';

class LoginController extends GetxController {
  //TODO: Implement HomeController

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
  late File imageFile;

  late TextEditingController emailC;
  late TextEditingController passwordC;
  TextEditingController titleC = TextEditingController();
  TextEditingController contentC = TextEditingController();
  TextEditingController descC = TextEditingController();
  final picker = ImagePicker();

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
            "rememberme": rememberme.value,
            "idUser": "36",
            "userName": userName.value,
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
          onConfirm: () => Get.back(),
        );
        print("Data Berhasil Ditambahkan");
        Get.back();
      } else {
        print("Data Gagal");
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

  // void selectImage() async {
  //   final PickedFile = (await picker.pickImage(
  //       source: ImageSource.gallery, maxHeight: 1920, maxWidth: 1080));

  //   if (PickedFile != null) {
  //     imageFile = File(PickedFile.path);
  //   } else {
  //     print("No Image Select");
  //   }
  // }

  // void submitAddNews() async {
  //   Uri url = Uri.parse("https://flutter.ramarumah.id/addNews.php");
  //   try {
  //     final Response = await http.MultipartFile('POST',url);
  //     http.Request.files.add()

  //       body: {
  //         "username": userName.value,
  //         "email": email.value,
  //         "password": password.value,
  //         // "content-type": "application/x-www-form-urlencoded",
  //       },
  //       headers: {
  //         // "content-type": "form-data",
  //         "content-type": "application/x-www-form-urlencoded",
  //       },
  //     );

  //     print((Response != null) ? "ada data" : "tidak ada data");
  //     var hasil = json.decode(Response.body) as Map<String, dynamic>;

  //     print(hasil);
  //     int value = hasil["value"];
  //     if (value == 1) {
  //       Get.defaultDialog(
  //         title: "Register",
  //         middleText: "Register Berhasil Ditambahkan",
  //         onConfirm: () => Get.back(),
  //       );
  //       print("Data Berhasil Ditambahkan");
  //       Get.back();
  //     } else {
  //       print("Data Gagal");
  //     }
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  @override
  void onInit() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
    titleC = TextEditingController();
    contentC = TextEditingController();
    descC = TextEditingController();
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
    titleC.dispose();
    contentC.dispose();
    descC.dispose();
  }
}
