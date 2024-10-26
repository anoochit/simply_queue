import 'dart:developer';

import 'package:get/get.dart';
import 'package:simply_queue_client/simply_queue_client.dart';
import 'package:simply_queue_store/serverpod.dart';

class HomeController extends GetxController {
  //

  RxList<Queue> listQueue = <Queue>[].obs;

  streamQueue({required int storeId}) async {
    try {
      client.queue.streamQueue(storeId).listen((update) {
        if (update is QueueSnapshot) {
          listQueue.value = update.queues;
        }
      });
    } on MethodStreamException catch (e) {
      log('error : $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    streamQueue(storeId: sessionManager.signedInUser!.id!);
  }
}
