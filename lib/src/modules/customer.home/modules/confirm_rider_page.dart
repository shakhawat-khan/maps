import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/components/map/live_tracking.dart';
import 'package:pattern_m/src/modules/customer.home/modules/rider_list.dart';

import '../../../providers/provider.dart';
import '../../../utils/style.dart';
import '../provider/home.provider.dart';
import '../../../components/map/distance_between_two_points/distance.dart';

class ConfirmRiderPage extends ConsumerWidget {
  const ConfirmRiderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confrim Rider'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 150, child: RiderInfromation()),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(height: 250, child: GoogleMapviewTwoPoints()),
              const SizedBox(
                height: 15,
              ),
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
                height: 15,
              ),
              TextField(
                maxLines: 6,
                decoration: const InputDecoration(
                  isDense: true,
                ),
                controller: ref.watch(
                  textControllerProvider('note'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Please stay for a while '),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LiveTracking()),
                    ).then((_) {
                      // ref.read(streamSubProvider).pause();
                    });
                  },
                  child: const Text('See Live Location'))
            ],
          ),
        ),
      ),
    );
  }
}
