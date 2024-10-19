import 'package:get/get.dart';
import 'package:kktest/app/data/models/globledata.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobleData(), permanent: true);
  }
}
