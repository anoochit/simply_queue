import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          // current queue
          Flexible(
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  // label
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Current Queue',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.grey.shade800),
                    ),
                  ),
                  Spacer(),
                  // number
                  Text(
                    'C1',
                    style: Theme.of(context).textTheme.displayLarge!.apply(
                          fontSizeFactor: 4.0,
                          color: Colors.green.shade600,
                        ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),

          VerticalDivider(
            thickness: 2.0,
          ),

          // waiting list
          Flexible(
            flex: 1,
            child: Column(
              children: [
                // label
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Waiting List',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.grey.shade800),
                  ),
                ),

                // list
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          'C${index + 2}',
                          style:
                              Theme.of(context).textTheme.displayLarge!.apply(
                                    color: Colors.grey.shade400,
                                  ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
