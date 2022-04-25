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

import '../../../assets/models/newsmodel.dart';
import '../../signup/controllers/signup_controller.dart';

class HomeController extends GetxController {
  RxString usernameAPI = "".obs;
  RxString idUser = "".obs;
  RxList allNewsData = List.empty().obs;

  RxBool loading = false.obs;

  getNewsData() async {
    allNewsData.clear(); //menghapus data list
    loading.value = true;
    print("okee");
    Uri url = Uri.parse("https://flutter.ramarumah.id/detailNews.php");
    try {
      final response = await http.get(
        url,
      );
      print((response != null) ? "ada data" : "tidak ada data");

      if (response.statusCode == 200) {
        var newsData = json.decode(response.body) as List;

        // allNewsData.value = List.from(newsData);
        // allNewsData.refresh();
        // allNewsData.add(newsData);

        allNewsData.refresh();
        print("--------");
        print(newsData.length);

        loading.value = false;
      } else {
        print("Data salah");
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
    // getNewsData();
  }
}
