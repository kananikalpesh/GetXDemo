import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:kktest/app/modules/userdetails/views/userdetails_view.dart';
import 'package:kktest/app/modules/widgets/userlist_view.dart';
import 'package:kktest/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.BUILD);
              },
              icon: Icon(Icons.restore))
        ],
      ),
      body: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: NotificationListener(
            onNotification: (ScrollNotification scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                print("kkkkkkkkkkkk");
                controller.loadMore();
              }
              return false;
            },
            child: Column(
              children: [
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          delay: Duration(milliseconds: 375),
                          duration: const Duration(milliseconds: 700),
                          child: SlideAnimation(
                            duration: const Duration(milliseconds: 700),
                            delay: Duration(milliseconds: 150),
                            verticalOffset: 50.0,
                            horizontalOffset: 50,
                            child: FadeInAnimation(
                              delay: Duration(milliseconds: 150),
                              duration: const Duration(milliseconds: 700),
                              child: AnimatedScale(
                                scale: 1,
                                duration: const Duration(milliseconds: 100),
                                child: OpenContainer(
                                  transitionType:
                                      ContainerTransitionType.fadeThrough,
                                  openElevation: 0,
                                  closedElevation: 0,
                                  useRootNavigator: false,
                                  openShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  closedShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  openColor:
                                      Theme.of(context).colorScheme.surface,
                                  transitionDuration: Duration(seconds: 100),
                                  middleColor:
                                      Theme.of(context).colorScheme.surface,
                                  openBuilder: (context, _) =>
                                      const UserdetailsView(),
                                  closedColor: Colors.blue,
                                  closedBuilder: (context, _) => UserListView(
                                    item: controller.userdatalist[index],
                                    callback: () {
                                      Get.toNamed(Routes.USERDETAILS,
                                          arguments:
                                              controller.userdatalist[index]);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      // separatorBuilder: (context, index) {
                      //   return const SizedBox(height: 10);
                      // },
                      itemCount: controller.userdatalist.length,
                    ),
                  ),
                ),
                Obx(
                  () => controller.hasLoadMore.value
                      ? const Padding(
                          padding: EdgeInsets.all(5),
                          child: CircularProgressIndicator())
                      : const SizedBox(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
