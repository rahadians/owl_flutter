// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final box = GetStorage();

  Widget build(BuildContext context) {
    if (box.read("dataLogin") != null) {
      print("data login ada");
      // final box = GetStorage();
      emailC.text = box.read("dataLogin")["email"];
      passwordC.text = box.read("dataLogin")["password"];
      controller.email.value = box.read("dataLogin")["email"];
      controller.password.value = box.read("dataLogin")["password"];
      controller.rememberme.value = true;
    } else {
      print("data login tidak ada");
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        //FLoating action button
        onPressed: () {
          final box = GetStorage();
          // box.remove('dataLogin');
          // if (box.read("dataLogin") != null) {
          //   print('data login ada');
          // } else {
          //   print("data login sudah tidak ada");
          // }
          // if (controller.email.value == "a@gmail.com" &&
          //     controller.password.value == "a") {
          //   controller.cekRemember();
          //   Get.toNamed("/homeScreen");
          // } else {
          //   print("salah password");
          // }
          // print(controller.password.value);
        },
      ),
      appBar: AppBar(
        title: Text('Owl Flutter'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: ListView(
              children: [
                TextFormField(
                  controller: emailC,
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Masukkan Email Anda";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) => controller.email.value = value!,
                  onChanged: (value) {
                    controller.email.value = value;
                  },
                  decoration: InputDecoration(labelText: "Email"),
                ),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: passwordC,
                  autocorrect: false,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Masukkan Password Anda";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (value) => controller.password.value = value!,
                  onChanged: (value) {
                    controller.password.value = value;
                    // print(controller.email.value);
                  },
                  decoration: InputDecoration(labelText: "Password"),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text("Remember Me"),
                    value: controller.rememberme.value,
                    onChanged: (value) {
                      controller.rememberme.toggle();
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: Text("Login"),
                ),
                // Obx(() => Text(controller.email.value))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
