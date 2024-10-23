import 'package:get/get.dart';
import 'package:simply_queue_client/simply_queue_client.dart';
import 'package:simply_queue_flutter/serverpod.dart';

class HomeController extends GetxController {
  //
  RxList<Store> listStore = <Store>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStoreData();
  }

  // load store data
  Future<void> loadStoreData() async {
    listStore.value = await client.store.getStores();
  }
}
