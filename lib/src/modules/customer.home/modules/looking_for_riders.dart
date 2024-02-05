import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/components/map/distance_between_two_points/distance.dart';

import 'package:pattern_m/src/modules/customer.home/provider/functions.dart';
import 'package:pattern_m/src/utils/style.dart';

import '../provider/home.provider.dart';

class LookingForRiders extends ConsumerWidget {
  const LookingForRiders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Looking for Riders'),
      ),
      body: FutureBuilder<void>(
        future: anotherScreen(context),
        builder: (context, snapshot) {
          return const FindingRiders();
        },
      ),
    );
  }
}

class FindingRiders extends ConsumerWidget {
  const FindingRiders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Pickup',
                  style: medium,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    controller: ref.watch(
                      textControllerProvider('pickUpLocation'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Delivery',
                  style: medium,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    controller: ref.watch(
                      textControllerProvider('deliveryLocation'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: const GoogleMapviewTwoPoints(),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Looking For Aviable Drivers',
              style: interBold,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
