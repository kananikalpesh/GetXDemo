import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/two_controller.dart';

class TwoView extends GetView<TwoController> {
  const TwoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TwoView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TwoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
