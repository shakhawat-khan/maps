import 'package:flutter/material.dart';

import 'package:pattern_m/src/components/information/information_card.dart';
import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';
import 'package:pattern_m/src/modules/deliveryman.home/modules/view/confirm_pickup.dart';
import 'package:pattern_m/src/utils/style.dart';

import '../../../../components/map/googlemap_location_rider_route.dart';
import '../../../customer.home/provider/home.provider.dart';

class CustomerDetailsPage extends StatelessWidget {
  const CustomerDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final temp = MediaQuery.of(context).size.width;
    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Customer Details'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const InfromationCard(
                        name: 'Person name', number: '01557038556'),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Pickup Location',
                      style: interBold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'You are 7 min away ',
                          style: medium,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: GooglemapLocation1(
                        latlngProvider: googleMapLatLngProviderPickup,
                      ),
                    ),
                    // SizedBox(
                    //   height: 300,
                    //   child: GooglemapLocation(
                    //     latlngProvider: googleMapLatLngProviderDelivery,
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 200,
                    //   child: GooglemapLocation(
                    //     latlngProvider: googleMapLatLngProviderPickup,
                    //   ),
                    // ),

                    //const GoogleMapView(heightSize: 200),
                    const SizedBox(
                      height: 20,
                    ),

                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ConfrimPickup()),
                          );
                        },
                        child: const Text('Confirm Pickup')),

                    const SizedBox(
                      height: 20,
                    ),

                    // const Text(
                    //   'Delivery Location',
                    //   style: interBold,
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: const [
                    //     Text(
                    //       'You are 30 min away ',
                    //       style: medium,
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),

                    // SizedBox(
                    //   height: 200,
                    //   child: GooglemapLocation1(
                    //     latlngProvider: googleMapLatLngProviderDelivery,
                    //   ),
                    // ),

                    //const GoogleMapView(heightSize: 200),
                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const SizedBox(
                    //       width: 40,
                    //     ),
                    //     Column(
                    //       children: const [
                    //         Text(
                    //           'Service Charge will be ',
                    //           style: medium,
                    //         ),
                    //         Text(
                    //           ' 200 taka',
                    //           style: moneyValue,
                    //         ),
                    //       ],
                    //     ),
                    //     const Spacer(),
                    //     ElevatedButton(
                    //       onPressed: () {},
                    //       child: const Text('Start Job'),
                    //     ),
                    //     const SizedBox(
                    //       width: 15,
                    //     )
                    //   ],
                    // ),
                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          )
        : const SmallScreenSize();
  }
}
