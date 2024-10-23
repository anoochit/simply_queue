import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

import '../../../../serverpod.dart';

class SigninController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // init
  @override
  void onInit() {
    super.onInit();

    if (kDebugMode) {
      emailController.text = 'store@example.com';
      passwordController.text = 'Hello123!';
    }
  }

  // signin
  Future<UserInfo?> signIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (formKey.currentState!.validate()) {
      final auth = EmailAuthController(client.modules.auth);
      final user = await auth.signIn(email, password);
      return user;
    }
    return null;
  }
}
