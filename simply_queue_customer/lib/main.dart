import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'serverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServerPodClient();
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
