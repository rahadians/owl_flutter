import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../assets/models/constant.dart';
import '../../home/controllers/home_controller.dart';

class AddnewsController extends GetxController {
  RxString title = "".obs;
  RxString content = "".obs;
  RxString description = "".obs;
  RxString idUser = "".obs;

  XFile? ambilGambar;

  late File imageFile;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var selectedImageName = ''.obs;
  final box = GetStorage();

  final HomeC = Get.find<HomeController>();

  TextEditingController titleC = TextEditingController();
  TextEditingController contentC = TextEditingController();
  TextEditingController desC = TextEditingController();

  selectImage(ImageSource imageSource) async {
    ambilGambar = await ImagePicker().pickImage(source: imageSource);
    if (ambilGambar != null) {
      selectedImagePath.value = ambilGambar!.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1920 / 1080)
                  .toStringAsFixed(2) +
              ' Mb';
      selectedImageName.value = ambilGambar!.name;

      update();
    } else {
      Get.snackbar('Error', 'Tidak ada image dipilih',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: kDarkerGreen);

      update();
    }
  }

  Future<void> submit() async {
    try {
      idUser.value = box.read("dataLogin")["idUser"];
      // var postUri = Uri.parse("https://flutter.ramarumah.id/addNews.php");

      // http.MultipartRequest request =
      //     new http.MultipartRequest("POST", postUri);

      // http.MultipartFile multipartFile =
      //     await http.MultipartFile.fromPath('file', selectedImagePath.value);

      // request.files.add(multipartFile);

      // http.StreamedResponse response = await request.send();

      // print(response.statusCode);

      idUser.value = box.read("dataLogin")["idUser"];
      Uri url = Uri.parse("https://flutter.ramarumah.id/addNews.php");

      var request = await http.MultipartRequest('POST', url);
      request.files.add(
          await http.MultipartFile.fromPath('image', selectedImagePath.value));

      request.fields['title'] = title.value;
      request.fields['content'] = content.value;
      request.fields['description'] = description.value;
      request.fields['id_user'] = box.read("dataLogin")["idUser"];

      // request.fields['title'] = "dua dua";
      // request.fields['content'] = "content tiga";
      // request.fields['description'] = "deskripsi tiga";
      // request.fields['id_user'] = "2233";

      var response = await request.send();

      if (response.statusCode == 200) {
        HomeC.getNewsData();
        Get.back();
        print("uploading sukses");
      } else {
        print("Data salah");
      }
      print((Response != null) ? "ada data" : "tidak ada data");
      // var hasil = json.decode(request.body) as Map<String, dynamic>;
    } catch (err) {
      debugPrint("${err}");
    }
  }
}
