// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:owl_flutter/app/modules/home/views/widgets/home_screen.dart';
import '../models/constant.dart';

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
        backgroundColor: kLightgreen,
        appBar: AppBar(
          title: Text('Owl Flutter'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        decoration:
                            kTextFieldDecoration.copyWith(hintText: 'Email'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => TextFormField(
                          controller: passwordC,
                          autocorrect: false,
                          obscureText: controller.secureText.value,
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
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'password',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.showHideText();
                                },
                                icon: Icon(controller.secureText.value
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          ),
                        ),
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
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.maxFinite, 50),
                          primary: kDarkerGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () => controller.login(),
                        child: Text(
                          "Login ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: GestureDetector(
            onVerticalDragStart: (detail) {
              showModalBottomSheet(
                isScrollControlled: true,
                enableDrag: true,
                context: context,
                builder: (context) => SignUpScreen(),
              );
            },
            child: Container(
              height: 80.0,
              color: kLightgreen,
              child: Container(
                child: Column(
                  children: [Icon(Icons.arrow_upward), Text("Sign Up")],
                ),
                decoration: BoxDecoration(
                    color: kYellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30.0))),
              ),
            ),
          ),
        ));
  }
}
