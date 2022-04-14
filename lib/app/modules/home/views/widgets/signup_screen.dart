// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:owl_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:owl_flutter/app/modules/home/views/widgets/home_screen.dart';
import '../../models/constant.dart';

class SignUpScreen extends GetView<HomeController> {
  @override
  final userNameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final box = GetStorage();

  Widget build(BuildContext context) {
    // if (box.read("dataLogin") != null) {
    //   print("data login ada");
    //   // final box = GetStorage();
    //   emailC.text = box.read("dataLogin")["email"];
    //   passwordC.text = box.read("dataLogin")["password"];
    //   controller.email.value = box.read("dataLogin")["email"];
    //   controller.password.value = box.read("dataLogin")["password"];
    //   controller.rememberme.value = true;
    // } else {
    //   print("data login tidak ada");
    // }

    return Scaffold(
      backgroundColor: kLightgreen,
      appBar: AppBar(
        title: Text('Register Owl Flutter'),
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
                      controller: userNameC,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Masukkan Username Anda";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) => controller.userName.value = value!,
                      onChanged: (value) {
                        controller.userName.value = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'User Name',
                          contentPadding: EdgeInsets.only(left: 10.0)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                      onPressed: () => controller.register(),
                      child: Text(
                        "Confirm ",
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
    );
  }
}
