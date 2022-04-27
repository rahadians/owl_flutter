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

  RxBool isloading = false.obs;

  Future getNewsData() async {
    allNewsData.clear(); //menghapus data list
    isloading.value = true;

    Uri url = Uri.parse("https://flutter.ramarumah.id/detailNews.php");
    try {
      final response = await http.get(
        url,
      );
      print((response != null) ? "ada data" : "tidak ada data");

      if (response.statusCode == 200) {
        var newsData = json.decode(response.body);

        // allNewsData.value = List.from(newsData);
        allNewsData.value = NewsModel.fromJsonList(newsData);

        print(allNewsData.length);
        // allNewsData.value.forEach((element) {
        //   print(element['title']);
        // });

        for (var item in newsData) {
          NewsModel(
            idNews: item['id_news'],
            // image: item['image'],
            title: item['title'],
            content: item['content'],
            description: item['description'],
            idUser: item['id_user'],
            username: item['username'],
          );
        }

        // }
        allNewsData.refresh();

        isloading.value = false;
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
    // getNewsData();
    super.onInit();
  }
}
