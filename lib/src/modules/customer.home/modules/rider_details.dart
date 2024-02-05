import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/customer.home/modules/confirm_rider_page.dart';
import 'package:pattern_m/src/modules/customer.home/modules/looking_for_riders.dart';
import 'package:pattern_m/src/modules/customer.home/modules/rider_list.dart';
import 'package:pattern_m/src/utils/style.dart';

import '../provider/home.provider.dart';

class RiderDetails extends ConsumerWidget {
  const RiderDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
                child: RiderInfromation(),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '200 Taka will be charged',
                style: interBold,
              ),
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
                height: 20,
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
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConfirmRiderPage()),
                        );
                      },
                      child: const Text('Confirm Rider'),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LookingForRiders()),
                    );
                  },
                  child: const Text('Look for another Rider'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
