import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_flutter/app/modules/home/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen View"),
      ),
      body: Center(
        child: Text("Home Screen Page"),
      ),
    );
  }
}
