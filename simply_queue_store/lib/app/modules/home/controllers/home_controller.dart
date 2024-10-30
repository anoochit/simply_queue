import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:simply_queue_client/simply_queue_client.dart';
import 'package:simply_queue_store/serverpod.dart';

class HomeController extends GetxController {
  // reactive queue
  RxList<Queue> listQueue = <Queue>[].obs;

  // subscription
  late StreamSubscription subscribe;

  @override
  void onInit() {
    super.onInit();
    // start stream
    startStreamQueue();
  }

  @override
  Future<void> dispose() async {
    // cancel subscription
    await subscribe.cancel();
    super.dispose();
  }

  // start stream
  startStreamQueue() {
    streamQueue(storeId: sessionManager.signedInUser!.id!);
  }

  // reload snapshot
  reloadSnapshot() async {
    final queues =
        await client.queue.queueSnapshot(sessionManager.signedInUser!.id!);
    if (queues != null) {
      listQueue.value = queues;
      listQueue.refresh();
    }
  }

  // stream queue
  streamQueue({required int storeId}) async {
    try {
      subscribe = client.queue.streamQueue(storeId).listen((update) {
        // get queue snapshot
        if (update is QueueSnapshot) {
          log('get queue snapshot');
          listQueue.value = update.queues;
        }

        // get update queue
        if (update is Queue) {
          log('get queue update, reload snapshots');
          // refresh data
          reloadSnapshot();
        }
      });
    } on MethodStreamException catch (e) {
      log('Error: $e');
      Get.snackbar('Error', 'Error: $e');
    }
  }

  // next queue
  nextQueue() async {
    // if first queue is wait, change to current queue
    if (listQueue.first.status == Status.wait) {
      try {
        // set first queue to current queue
        log('Change first item to queue');
        await client.queue.nextFirstQueue(listQueue.first);
      } on MethodStreamException catch (e) {
        log('Error: $e');
        Get.snackbar('Error', 'Error: $e');
      }
    }

    // if fist queue is queue, change to done and next wait is queue
    if (listQueue.first.status == Status.current) {
      try {
        // set first queue to done and second queue to current
        log('Change first item to done, next wait is queue');
        if (listQueue.length > 1) {
          await client.queue.nextWaitQueue(listQueue[0], listQueue[1]);
        }
      } on MethodStreamException catch (e) {
        log('Error: $e');
        Get.snackbar('Error', 'Error: $e');
      }
    }
  }
}
