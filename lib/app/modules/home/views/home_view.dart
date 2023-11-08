import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/app/utils/sizer/sizer.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.grey[200],
            width: 300,
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller.name,
                    decoration:
                        InputDecoration(hintText: "Please_enter_value".tr),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "OBX_Method".tr,
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  Obx(() => Text(controller.txtvalue.value ?? "")),
                  const SizedBox(height: 40),
                  Text(
                    "GetX_Method".tr,
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  GetX<HomeController>(
                    init: HomeController(),
                    initState: (_) {},
                    builder: (_) {
                      return Text(controller.txtvalue.value ?? "");
                    },
                  ),
                  const SizedBox(height: 40),
                  Text(
                    "GetBuilder_Method".tr,
                    style: TextStyle(color: Colors.green),
                  ),
                  const SizedBox(height: 10),
                  GetBuilder<HomeController>(
                    builder: (controller) {
                      return Text(controller.txtvalue1);
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: const Text('Data Change'),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          controller.submitValue();
                        },
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        child: const Text('Redirect to second page'),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Get.toNamed(Routes.TWO);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
