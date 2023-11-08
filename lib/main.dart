import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/app/modules/home/views/home_view.dart';
import 'package:getxdemo/app/translations/app_translation.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translations,
      locale: const Locale('in', 'IN'),
      title: 'Flutter Demo',
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      home: const HomeView(),
    );
  }
}
