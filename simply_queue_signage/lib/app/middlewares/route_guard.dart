import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import 'package:simply_queue_signage/serverpod.dart';

import '../routes/app_pages.dart';

class RouteGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // final auth = sessionManager.isSignedIn;
    // if (auth) {
    //   return null;
    // } else {
    //   return const RouteSettings(name: Routes.SIGNIN);
    // }
    return null;
  }
}
