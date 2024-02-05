import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/customer.home/modules/rider_details.dart';

import '../../../utils/style.dart';
import '../provider/home.provider.dart';
import '../../../components/map/distance_between_two_points/distance.dart';

class RidersList extends ConsumerWidget {
  const RidersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rider List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
              height: 20,
            ),
            SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: const GoogleMapviewTwoPoints(),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 120,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RiderDetails()),
                      );
                    },
                    child: const RiderInfromation(),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}

class RiderInfromation extends StatelessWidget {
  const RiderInfromation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/flutter_logo.png'),
                backgroundColor: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Shakhawat Hossain',
                    style: medium,
                  ),
                  const Text(
                    '3 min away',
                    style: TextStyle(fontSize: 12),
                  ),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: const [
                  Icon(
                    Icons.phone,
                    size: 35,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.whatshot,
                    size: 35,
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
