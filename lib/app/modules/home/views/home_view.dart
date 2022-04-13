// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(controller.email.value);
        print(controller.password.value);
      }),
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
                  // onSaved: (value) => controller.email.value = value!,
                  onChanged: (value) {
                    controller.email.value = value;
                    // print(controller.email.value);
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
                      value: controller.rememberMe.value,
                      onChanged: controller.rememberMe.toggle()),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.login();
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
