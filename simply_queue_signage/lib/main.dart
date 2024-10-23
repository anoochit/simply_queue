import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:simply_queue_signage/serverpod.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServerPodClient();
  runApp(
    GetMaterialApp(
      title: "Signage",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
