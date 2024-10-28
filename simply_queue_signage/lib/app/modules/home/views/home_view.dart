import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simply_queue_client/simply_queue_client.dart';

import '../../../../config.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          // current queue
          showCurrentQueue(context),

          const VerticalDivider(
            thickness: 2.0,
          ),

          // waiting list
          showWaitingList(context)
        ],
      ),
    ));
  }

  // waiting list
  Widget showWaitingList(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          // label
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              'Waiting List',
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                    color: Colors.grey.shade800,
                  ),
            ),
          ),

          // list
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.listQueue.length,
                itemBuilder: (context, index) {
                  final item = controller.listQueue[index];
                  final queueNumber = item.number;
                  final queueStatus = item.status;

                  if (queueStatus != Status.current) {
                    return ListTile(
                      title: Text(
                        '$queuePrefix$queueNumber',
                        style: Theme.of(context).textTheme.displayLarge!.apply(
                              color: Colors.grey.shade500,
                              fontWeightDelta: 3,
                            ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // current queue
  Widget showCurrentQueue(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Obx(
        () {
          if (controller.listQueue.isNotEmpty) {
            final queue = controller.listQueue.first;

            if (queue.status == Status.current) {
              return Center(
                child: Column(
                  children: [
                    // label
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Current Queue',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.grey.shade800),
                      ),
                    ),
                    const Spacer(),
                    // number
                    Text(
                      '$queuePrefix${queue.number}',
                      style: Theme.of(context).textTheme.displayLarge!.apply(
                            fontWeightDelta: 3,
                            fontSizeFactor: 4.0,
                            color: Colors.green.shade600,
                          ),
                    ),
                    const Spacer(),
                  ],
                ),
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
