import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owl_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:owl_flutter/app/modules/home/models/constant.dart';

class AddNewsScreen extends GetView<HomeController> {
  // const AddNewsScreen({Key? key}) : super(key: key);
  final box = GetStorage();
  final picker = ImagePicker();

  _selectImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 1920, maxWidth: 1080);
    //ini ada setstate di YT
    if (pickedFile != null) {
      controller.imageFile = File(pickedFile.path);
    } else {
      print("No Image Selected");
    }
  }

  submit() async {
    try {
      var uri = Uri.parse("https://flutter.ramarumah.id/addNews.php");
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath(
          'image', controller.imageFile.path));
      request.fields['title'] = controller.title.value;
      request.fields['content'] = controller.content.value;
      request.fields['description'] = controller.description.value;
      request.fields['id_user'] = controller.idUser.value;

      var response = await request.send();

      if (response.statusCode == 200) {
        print("Uploading Success");
        Get.back();
      }
    } catch (err) {
      debugPrint("${err}");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleC = TextEditingController();
    TextEditingController contentC = TextEditingController();
    TextEditingController descC = TextEditingController();

    if (box.read("dataLogin") != null) {
      print("data login ada");

      controller.idUser.value = box.read("dataLogin")["id_user"];
    } else {
      print("data login tidak ada");
    }

    var placeHolder = Container(
      width: double.infinity,
      height: 150,
      child: Image.asset("assets/img/dummyimage.png"),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("Add News Screen"),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              child: controller.imageFile == null
                  ? placeHolder
                  : InkWell(
                      child: Image.file(
                        controller.imageFile,
                        fit: BoxFit.fitHeight,
                      ),
                      onTap: () {
                        _selectImage();
                      },
                    ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: titleC,
              decoration: kTextFieldDecoration.copyWith(labelText: "Title"),
              onChanged: (value) => controller.title.value = value,
            ),
            TextFormField(
              controller: contentC,
              decoration: kTextFieldDecoration.copyWith(labelText: "Content"),
              onChanged: (value) => controller.content.value = value,
              keyboardType: TextInputType.multiline,
              maxLength: null,
            ),
            TextFormField(
              controller: descC,
              decoration:
                  kTextFieldDecoration.copyWith(labelText: "Description"),
              onChanged: (value) => controller.description.value = value,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Upload"),
            ),
          ],
        ));
  }
}
