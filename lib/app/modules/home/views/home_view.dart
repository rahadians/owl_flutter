import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_flutter/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed('/addnews');
          // Get.toNamed('/imagepicker');
          controller.getNewsData();
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Home Screen View"),
      ),
      body: Center(
        child: Text("Home Screen Page"),
      ),
    );
  }
}
