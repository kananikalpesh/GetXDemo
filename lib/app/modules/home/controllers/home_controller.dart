import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController name = TextEditingController();

  // Getx and OBX this use this
  //RxString txtvalue = ''.obs;
  Rxn<String?> txtvalue = Rxn<String?>("");

  // Use this GetBuilder
  String txtvalue1 = '';

  // ignore: unnecessary_overrides
  @override
  void onInit() {
    super.onInit();
  }

  void submitValue() {
    // Getx and OBX this use this
    txtvalue.value = name.text;

    // Use this GetBuilder
    txtvalue1 = name.text;
    update();
  }
}
