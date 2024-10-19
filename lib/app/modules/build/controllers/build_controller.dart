import 'dart:async';

import 'package:get/get.dart';
import 'package:kktest/app/data/models/globledata.dart';

class BuildController extends GetxController {
  StreamController streamController = StreamController.broadcast();
  int i = 0;

  @override
  void onInit() {
    //streamController.sink.add(1);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamController.close();
    super.onClose();
  }

  Future<String> getFutureData() async {
    await Future.delayed(Duration(seconds: 5));
    String name = Get.find<GlobleData>().name;
    return name;
  }

  void increaseValue() {
    i++;
    streamController.sink.add(i);
  }
}
