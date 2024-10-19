import 'package:get/get.dart';

import '../controllers/userdetails_controller.dart';

class UserdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserdetailsController>(
      () => UserdetailsController(),
    );
  }
}
