import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/build_controller.dart';

class BuildView extends GetView<BuildController> {
  const BuildView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("buildcall");
    return Scaffold(
      appBar: AppBar(
        title: const Text('BuildView'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.increaseValue();
          },
          child: const Icon(Icons.add)),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "Future Builder",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                  future: controller.getFutureData(),
                  builder: (context, snapshot) {
                    print("future builder call");
                    if (snapshot.hasData) {
                      return Text(snapshot.data ?? "");
                    }
                    return const Text("Fetching ....");
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                const Text(
                  "Stream Builder",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                StreamBuilder(
                  initialData: 0,
                  stream: controller.streamController.stream,
                  builder: (context, snapshot) {
                    print("Stream Builder Call");
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.hasData) {
                      return Text(snapshot.data.toString());
                    }
                    return const Text("Fetching ....");
                  },
                ),
                StreamBuilder(
                  initialData: 0,
                  stream: getDatas(),
                  builder: (context, snapshot) {
                    print("Stream Builder Call");
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.hasData) {
                      return Text(snapshot.data.toString());
                    }
                    return const Text("Fetching ....");
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// A stream that emits numbers from 0 to 9, with a 1 second delay between
  /// each emission.
  Stream<int> getDatas() async* {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }
}
