import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owl_flutter/app/modules/signup/controllers/signup_controller.dart';

import '../../../assets/models/constant.dart';

import 'package:owl_flutter/app/modules/signup/views/signup_view.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/addnews_controller.dart';

import './../../signup/views/signup_view.dart';

class AddnewsView extends GetView<AddnewsController> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    if (box.read("dataLogin") != null) {
      print("data addnews ada");
      // final box = GetStorage();
      // controller.idUser.value = box.read("dataLogin")["idUser"].toString();
      print("------");
      print(box.read("dataLogin")["idUser"]);
      // print(controller.idUser.value);
    } else {
      print("data login tidak ada");
    }

    // File _imageFile;

    final picker = ImagePicker();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            InkWell(
              onTap: () => controller.selectImage(ImageSource.gallery),
              child: GetBuilder<AddnewsController>(builder: (controller) {
                return Container(
                    width: double.infinity,
                    height: 200,
                    child: (controller.ambilGambar != null)
                        ? Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                ),
                            child: Image.file(
                              File(controller.ambilGambar!.path),
                              fit: BoxFit.cover,
                            ))
                        : Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(),
                            child: Image(
                                image: AssetImage(
                                    'lib/app/assets/img/dummyimage.png'))));
              }),
            ),
            TextFormField(
              controller: controller.titleC,
              decoration: kTextFieldDecoration.copyWith(labelText: "Title"),
              onChanged: (value) => controller.title.value = value,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLength: null, //menyesuaikan isi kontent
              controller: controller.contentC,
              decoration: kTextFieldDecoration.copyWith(labelText: "Content"),
              onChanged: (value) => controller.content.value = value,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.desC,
              decoration:
                  kTextFieldDecoration.copyWith(labelText: "Description"),
              onChanged: (value) => controller.description.value = value,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.submit();
                },
                child: Text("Confirm"))
          ]),
        ),
      ),
    );
  }
}
