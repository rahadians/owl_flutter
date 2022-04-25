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
  RxList<NewsModel> allNewsData = List<NewsModel>.empty().obs;
  List<NewsModel> semuadata = [];
  RxBool loading = false.obs;

  Future<void> getNewsData() async {
    allNewsData.clear(); //menghapus data list
    loading.value = true;

    Uri url = Uri.parse("https://flutter.ramarumah.id/detailNews.php");
    try {
      final response = await http.get(
        url,
      );
      print((response != null) ? "ada data" : "tidak ada data");

      if (response.statusCode == 200) {
        print(response.body);
        // var newsData = json.decode(response.body) as List;

        // newsData.forEach((element) {
        //   final listData = NewsModel(
        //       idNews: element['id_news'],
        //       image: element["image"],
        //       title: element["title"],
        //       content: element["content"],
        //       description: element["description"],
        //       // dateNews: element["date_news"],
        //       idUser: element["id_user"],
        //       username: element["username"]);
        // });

        print("--------");
        // print(newsData);
        // print(dataNote.length);

        allNewsData.refresh();

        // print(allNewsData);
        // print(newsData.runtimeType);

        loading.value = false;
      } else {
        print("Data salah");
      }
    } catch (err) {
      print(err);
    }
  }
}
