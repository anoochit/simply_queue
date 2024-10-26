import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simply_queue_store/config.dart';
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
      // TODO : show current queue, waiting list, move or cancel quere and reset queue
      body: Obx(
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
    );
  }
}
