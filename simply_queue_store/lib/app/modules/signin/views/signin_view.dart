import 'package:flutter/material.dart';

import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 360.0,
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // title
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Gap(16.0),

                // username
                TextFormField(
                  controller: controller.emailController,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter email address';
                    }

                    return null;
                  },
                ),
                const Gap(16.0),
                // password
                TextFormField(
                  controller: controller.passwordController,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }

                    return null;
                  },
                ),
                const Gap(16.0),
                // button
                SizedBox(
                  width: context.width,
                  child: OutlinedButton.icon(
                    onPressed: () => controller.signIn(),
                    icon: const Icon(Icons.lock_open),
                    label: const Text('Sign In'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
