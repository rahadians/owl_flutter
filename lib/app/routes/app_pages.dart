import 'package:get/get.dart';
import 'package:owl_flutter/app/modules/home/views/home_screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/homeScreen',
      page: () => HomeScreen(),
      // binding: HomeBinding(),
    ),
  ];
}
