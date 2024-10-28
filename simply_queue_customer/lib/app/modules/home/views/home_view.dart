import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:simply_queue_client/simply_queue_client.dart';
import 'package:simply_queue_flutter/config.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          // current queue
          ListTile(
            title: Text(
              'Your Queue',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(fontWeightDelta: 3),
            ),
          ),
          listQueue(),

          // store list
          ListTile(
            title: Text(
              'Store',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(fontWeightDelta: 3),
            ),
          ),
          listStore()
        ],
      ),
    );
  }

  // list current queue
  Widget listQueue() {
    return Obx(
      () => ListView.builder(
        itemCount: controller.listQueue.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final item = controller.listQueue[index];
          final queueNumber = item.number;
          final queueStatus = item.status;
          final queueStatusColors =
              (queueStatus == Status.current) ? Colors.green : Colors.grey;
          final storeName = item.store!.name;
          return ListTile(
            leading: Icon(Icons.person_2),
            title: Text('$storeName ($prefixQueue$queueNumber)'),
            trailing: Text(
              queueStatus.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: queueStatusColors),
            ),
          );
        },
      ),
    );
  }

  // store list
  Widget listStore() {
    return Obx(
      () => GridView.builder(
        itemCount: controller.listStore.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          final item = controller.listStore[index];
          final imageUrl = item.image;
          final name = item.name;
          final storeId = item.id!;
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0.3,
            child: GridTile(
              footer: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // title
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade200,
                          ),
                    ),
                  ),
                  // queue button
                  FilledButton.tonal(
                    onPressed: () => createQueueDialog(context, storeId),
                    child: Text('Queue'),
                  ),
                  Gap(8.0)
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  createQueueDialog(BuildContext context, int storeId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Create queue'),
        content: Text('Create for this store?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('No'),
          ),
          TextButton(
            onPressed: () async {
              // create queue
              await controller.createQueue(storeId: storeId);
              Get.back();
            },
            child: Text('Yes'),
          )
        ],
      ),
    );
  }
}
