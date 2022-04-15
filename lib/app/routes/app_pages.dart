import 'package:get/get.dart';
import 'package:owl_flutter/app/modules/home/views/widgets/home_screen.dart';
import 'package:owl_flutter/app/modules/home/views/widgets/splash_screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/addnewsscreen.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/widgets/signup_screen.dart';
import '../modules/home/views/widgets/home_screen.dart';
import '../modules/home/views/widgets/test.dart';

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
    GetPage(
      name: '/SignUpScreen',
      page: () => SignUpScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: '/SplashScreen',
      page: () => SplashScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: '/AddNewsScreen',
      page: () => AddNewsScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: '/Test',
      page: () => Test(),
      // binding: HomeBinding(),
    ),
  ];
}
