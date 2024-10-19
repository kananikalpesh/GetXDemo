import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kktest/app/data/models/userdata.dart';
import 'package:kktest/app/routes/app_pages.dart';

class UserListView extends StatelessWidget {
  UserData item;
  VoidCallback callback;
  UserListView({required this.item, required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback.call();
        // Get.toNamed(Routes.USERDETAILS);
      },
      child: ListTile(
        leading: Image.network(item.picture?.medium ?? ""),
        title: Text("${item.name?.first} ${item.name?.last}"),
      ),
    );
  }
}
