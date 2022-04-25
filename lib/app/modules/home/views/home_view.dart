import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:owl_flutter/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri url = Uri.parse("https://flutter.ramarumah.id/upload/");
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
        body: RefreshIndicator(
          onRefresh: () => controller.getNewsData(),
          child: controller.loading.value
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: controller.allNewsData.length,
                  itemBuilder: (context, index) {
                    final newsBody = controller.allNewsData[index];
                    return Obx(() => Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120,
                                  height: 100,
                                  margin: EdgeInsets.only(right: 20.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${url}${newsBody.image}"),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        newsBody.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Row(
                                        children: [
                                          Text(newsBody.description),
                                          Text('    '),
                                          Text(newsBody.dateNews),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Edit",
                                            ),
                                          ),
                                          Text('     |       '),
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Delete"))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ]),
                        ));
                  }),
        ));
  }
}
