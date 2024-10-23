import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
      body: Column(
        children: [
          // current queue
          listQueue(),

          // store list
          listStore()
        ],
      ),
    );
  }

  // current queue
  Widget listQueue() {
    return Container();
  }

  // store list
  Widget listStore() {
    return Expanded(
      child: Obx(
        () => GridView.builder(
          itemCount: controller.listStore.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (BuildContext context, int index) {
            final item = controller.listStore[index];
            final imageUrl = item.image;
            final name = item.name;
            return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 0.3,
              child: GridTile(
                footer: Padding(
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
