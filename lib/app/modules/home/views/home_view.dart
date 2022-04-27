import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_flutter/app/assets/models/constant.dart';
import 'package:owl_flutter/app/assets/models/newsmodel.dart';
import 'package:owl_flutter/app/assets/models/readnews.dart';
import 'package:owl_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:owl_flutter/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  final HomeC = Get.find<HomeController>();

  // const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri url = Uri.parse("https://flutter.ramarumah.id/upload/");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/addnews');
          // Get.toNamed('/imagepicker');
          // controller.getNewsData();
          controller.isloading.value = false;
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: HomeC.getNewsData(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Obx(() => (HomeC.allNewsData.isEmpty)
                  ? Center(
                      child: Text(
                        "Data Tidak Ada",
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => HomeC.getNewsData(),
                      child: (HomeC.isloading.value)
                          ? CircularProgressIndicator()
                          : ListView.builder(
                              itemCount: HomeC.allNewsData.length,
                              itemBuilder: (context, index) {
                                NewsModel newsBody = HomeC.allNewsData[index];
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.README_NEWS, arguments: [
                                      {
                                        "title": newsBody.title,
                                        "content": newsBody.content,
                                        "description": newsBody.description,
                                        "id_news": newsBody.idNews.toString()
                                      },
                                    ]);
                                  },
                                  child: ListTile(
                                      leading: CircleAvatar(
                                          child: Image.network(
                                            'https://picsum.photos/250?image=9',
                                            fit: BoxFit.cover,
                                          ),
                                          backgroundColor: Colors.blue),
                                      title: Text("${newsBody.title}"),
                                      subtitle: Text("${newsBody.content}"),
                                      trailing: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {},
                                      )),
                                );
                              }),
                    ));
            }),
          ),
        ),
      ),
    );
  }
}
