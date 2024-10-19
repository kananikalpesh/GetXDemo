import 'package:get/get.dart';

import '../modules/build/bindings/build_binding.dart';
import '../modules/build/views/build_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/userdetails/bindings/userdetails_binding.dart';
import '../modules/userdetails/views/userdetails_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.USERDETAILS,
      page: () => const UserdetailsView(),
      binding: UserdetailsBinding(),
    ),
    GetPage(
      name: _Paths.BUILD,
      page: () => const BuildView(),
      binding: BuildBinding(),
    ),
  ];
}
