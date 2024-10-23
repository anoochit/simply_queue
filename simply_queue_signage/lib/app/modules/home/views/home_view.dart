import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../config.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: const EdgeInsets.all(8.0),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          // TODO : current queue
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
                  const Spacer(),
                  // number
                  Text(
                    '$queuePrefix${1}',
                    style: Theme.of(context).textTheme.displayLarge!.apply(
                          fontWeightDelta: 3,
                          fontSizeFactor: 3.8,
                          color: Colors.green.shade600,
                        ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),

          const VerticalDivider(
            thickness: 2.0,
          ),

          // TODO : waiting list
          Flexible(
            flex: 1,
            child: Column(
              children: [
                // label
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Waiting List',
                    style: Theme.of(context).textTheme.headlineSmall!.apply(
                          color: Colors.grey.shade800,
                        ),
                  ),
                ),

                // list
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          '$queuePrefix${index + 2}',
                          style:
                              Theme.of(context).textTheme.displayLarge!.apply(
                                    color: Colors.grey.shade500,
                                    fontWeightDelta: 3,
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
