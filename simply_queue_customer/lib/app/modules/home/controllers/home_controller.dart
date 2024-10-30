import 'dart:developer';

import 'package:get/get.dart';
import 'package:simply_queue_client/simply_queue_client.dart';
import 'package:simply_queue_flutter/config.dart';
import 'package:simply_queue_flutter/serverpod.dart';

class HomeController extends GetxController {
  //
  RxList<Store> listStore = <Store>[].obs;
  RxList<Queue> listQueue = <Queue>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStoreData();
    loadCustomerStreamQueue();
  }

  // load store data
  Future<void> loadStoreData() async {
    final stores = await client.store.getStores();

    if (stores.isNotEmpty) {
      listStore.value = stores;
    }
  }

  // reload customer snapshot
  Future<void> reloadSnapshot() async {
    final queues = await client.queue
        .customerQueueSnapshot(sessionManager.signedInUser!.id!);
    listQueue.value = queues;
    listQueue.refresh();
  }

  // load customer queue
  loadCustomerStreamQueue() async {
    final stream =
        client.queue.customerStreamQueue(sessionManager.signedInUser!.id!);

    stream.listen((update) async {
      // get queue snapshot
      if (update is QueueSnapshot) {
        log('get customer queue snapshot');
        listQueue.value = update.queues;
        notifyQueued();
      }
      // get update queue
      if (update is Queue) {
        log('get customer update queue');
        await reloadSnapshot();
        notifyQueued();
      }
    });
  }

  // notify queued
  notifyQueued() {
    final queue = listQueue.where((p) => (p.status == Status.current));
    for (var item in queue) {
      Get.snackbar(
        'Alert',
        'Now is your queue $prefixQueue${item.number} for ${item.store?.name ?? ''}',
        duration: Duration(seconds: 2),
        isDismissible: true,
      );

      Future.delayed(
        Duration(seconds: 3),
      );
    }
  }

  // create queue
  Future<Queue?> createQueue({required int storeId}) async {
    log('create queue for store = $storeId, user = ${sessionManager.signedInUser!.id!}');
    final result = await client.queue.createQueue(storeId);

    return result;
  }
}
