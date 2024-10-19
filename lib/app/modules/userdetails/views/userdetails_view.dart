import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/userdetails_controller.dart';

class UserdetailsView extends GetView<UserdetailsController> {
  const UserdetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserdetailsView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Image.network(
            controller.userData.picture?.large ?? "",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
              "${controller.userData.name?.title}. ${controller.userData.name?.first} ${controller.userData.name?.last}"),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${controller.userData.email}"),
                const SizedBox(
                  height: 5,
                ),
                Text("${controller.userData.phone}"),
                const SizedBox(
                  height: 5,
                ),
                Text("${controller.userData.gender}"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
