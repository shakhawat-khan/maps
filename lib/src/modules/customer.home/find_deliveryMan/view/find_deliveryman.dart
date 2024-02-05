import 'package:flutter/material.dart';
import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';
import 'package:pattern_m/src/utils/style.dart';

import '../../../../components/information/information_card.dart';
import '../../../../components/map/googlemap_view.dart';

class UserToDeliveryman extends StatelessWidget {
  const UserToDeliveryman({super.key});

  @override
  Widget build(BuildContext context) {
    final temp = MediaQuery.of(context).size.width;
    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Delivery man details'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const InfromationCard(
                      name: 'Api Name',
                      number: '01557038556',
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Live Tracking',
                      style: interBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const GoogleMapView(
                      heightSize: 200,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Time needed from PickUp point',
                      style: interBold,
                    ),
                    Text(DateTime.now().toString()),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Service charge will be -'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          ' 100 Taka',
                          style: interBold,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Confirm Service'),
                    )
                  ],
                ),
              ),
            ),
          )
        : const SmallScreenSize();
  }
}
