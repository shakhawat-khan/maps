import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/components/map/distance_between_two_points/distance.dart';
import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';
import 'package:pattern_m/src/modules/customer.home/provider/home.provider.dart';
import 'package:pattern_m/src/modules/provider/providers.dart';

import '../../../utils/style.dart';
import '../modules/view/customer_details.dart';

class DeliveryManHomeView extends ConsumerWidget {
  const DeliveryManHomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temp = MediaQuery.of(context).size.width;
    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Delivery man Serviec'),
            ),
            body: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (index + 1).toString(),
                                    style: interBold,
                                  )
                                ],
                              ),
                              const Text(
                                'Pickup Location',
                                style: interBold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(ref
                                  .watch(
                                      textControllerProvider('pickUpLocation'))
                                  .text),
                              const SizedBox(
                                height: 10,
                              ),

                              SizedBox(
                                height: 250,
                                width: MediaQuery.of(context).size.width,
                                child: const GoogleMapviewTwoPoints(),
                              ),

                              const SizedBox(
                                height: 10,
                              ),

                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Deliver Location',
                                style: interBold,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(ref
                                  .watch(textControllerProvider(
                                      'deliveryLocation'))
                                  .text),
                              const SizedBox(
                                height: 10,
                              ),
                              // const GoogleMapView(
                              //   heightSize: 120,
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: const [
                              //     Text(
                              //       'you are 25 min away ',
                              //       textAlign: TextAlign.end,
                              //     ),
                              //     SizedBox(
                              //       width: 20,
                              //     ),
                              //     SizedBox(
                              //       height: 10,
                              //     ),
                              //   ],
                              // ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Service charge will be ',
                                    style: medium,
                                  ),
                                  Text(
                                    ' 200 tk',
                                    style: moneyValue,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // CountdownTimer(

                                  //   onEnd: () {
                                  //     print('end');
                                  //   },
                                  //   endTime: DateTime.now().millisecondsSinceEpoch +
                                  //       1000 * 15,
                                  // ),
                                  CircularCountDownTimer(
                                    width: 50.5,
                                    isReverse: true,
                                    height: 50.5,
                                    duration: ref.watch(countProvider),
                                    fillColor: Colors.white,
                                    ringColor: Colors.red,
                                    onComplete: () {
                                      ref
                                          .read(timerProvider.notifier)
                                          .changeRequest();
                                    },
                                  ),

                                  const SizedBox(
                                    width: 10,
                                  ),

                                  Flexible(
                                    child: Text(
                                      ref.watch(timerProvider),
                                      style: medium,
                                    ),
                                  ),
                                  const Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CustomerDetailsPage()),
                                      );
                                    },
                                    child: const Text('Pick'),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: 2),
                ),
              ],
            ))
        : const SmallScreenSize();
  }
}
