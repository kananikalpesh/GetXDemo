import 'package:get/get.dart';

import '../controllers/two_controller.dart';

class TwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoController>(
      () => TwoController(),
    );
  }
}
