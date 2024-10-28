import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../config.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      // show current queue, waiting list, move or cancel quere and reset queue
      body: Flex(
        direction: Axis.vertical,
        children: [
          // list queue
          Flexible(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.listQueue.length,
                itemBuilder: (BuildContext context, int index) {
                  final queue = controller.listQueue[index];
                  final queueNo = queue.number;
                  final queueStatus = queue.status;
                  return ListTile(
                    title: Text('$queuePrefix$queueNo'),
                    trailing: Text(queueStatus.name),
                  );
                },
              ),
            ),
          ),
          // button next queue
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => (controller.listQueue.isNotEmpty)
                  ? SizedBox(
                      width: context.width,
                      child: FilledButton.tonal(
                        onPressed: () => nextQueue(context),
                        child: const Text('Next Queue'),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      ),
    );
  }

  nextQueue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Queue'),
        content: const Text('Do you want to escerate next queue ?'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('No')),
          TextButton(
            onPressed: () {
              controller.nextQueue();
              Get.back();
            },
            child: const Text('Yes'),
          )
        ],
      ),
    );
  }
}
