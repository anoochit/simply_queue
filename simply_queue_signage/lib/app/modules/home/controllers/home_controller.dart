import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:simply_queue_client/simply_queue_client.dart';
import 'package:simply_queue_signage/serverpod.dart';

class HomeController extends GetxController {
  //
  RxList<Queue> listQueue = <Queue>[].obs;

  late StreamSubscription subscription;

  @override
  void onInit() {
    super.onInit();
    streamQueue();
  }

  streamQueue() {
    final stream = client.queue.streamQueue(sessionManager.signedInUser!.id!);

    subscription = stream.listen((update) async {
      // get queue snapshot
      if (update is QueueSnapshot) {
        log('get snapshot queue');
        listQueue.value = update.queues;
        listQueue.refresh();
      }

      // get update queue
      if (update is Queue) {
        log('get update queue');
        await reloadQueueSnapshot();
      }
    });
  }

  reloadQueueSnapshot() async {
    final queues =
        await client.queue.queueSnapshot(sessionManager.signedInUser!.id!);

    if (queues != null) {
      listQueue.value = queues;
      listQueue.refresh();
    }
  }
}
