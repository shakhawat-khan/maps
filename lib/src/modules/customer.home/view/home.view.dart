import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/constants/constants.dart';

import 'package:pattern_m/src/modules/ScreenSize/small_screen.dart';
import 'package:pattern_m/src/modules/customer.home/modules/google_map.dart';
import 'package:pattern_m/src/modules/customer.home/provider/home.provider.dart';

import '../../../components/map/distance_between_two_points/distance.dart';
import '../../../components/testing/search_map.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final temp = MediaQuery.of(context).size.width;
    final deliveryTextController =
        ref.watch(textControllerProvider('deliveryLocation'));
    final pickupTextController =
        ref.watch(textControllerProvider('pickUpLocation'));

    return temp > 350
        ? Scaffold(
            appBar: AppBar(
              title: const Text('Delivery Service'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Where I am'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Pickup Location'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchMapPlaceWidget1(
                          textEditingController: ref.watch(
                            textControllerProvider('pickUpLocation'),
                          ),
                          location: const LatLng(lat, long),
                          onSelected: (place) async {
                            final geolocaton = await place.geolocation;
                            if (geolocaton == null) {
                              return;
                            }

                            LatLng temp = geolocaton.coordinates;

                            ref
                                .read(googleMapLatLngProviderPickup.notifier)
                                .update((state) => temp);

                            ref
                                .read(tempMarkerProvider.notifier)
                                .update((state) => temp);
                          },
                          apiKey: apiKey,
                          hasClearButton: true,
                          radius: 3000,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoogleMapTest(
                                  latlangProvider:
                                      googleMapLatLngProviderPickup,
                                  textEditingController: ref.watch(
                                    textControllerProvider('pickUpLocation'),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.map),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Pick location from google map'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Delivery location'),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchMapPlaceWidget1(
                          textEditingController: ref.watch(
                              textControllerProvider('deliveryLocation')),
                          location: const LatLng(lat, long),
                          onSelected: (place) async {
                            final geolocaton = await place.geolocation;
                            if (geolocaton == null) {
                              return;
                            }

                            LatLng temp = geolocaton.coordinates;

                            ref
                                .read(googleMapLatLngProviderDelivery.notifier)
                                .update((state) => temp);

                            ref
                                .read(tempMarkerProvider.notifier)
                                .update((state) => temp);
                          },
                          apiKey: apiKey,
                          bgColor: Colors.white,
                          hasClearButton: true,
                          radius: 3000,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoogleMapTest(
                                  latlangProvider:
                                      googleMapLatLngProviderDelivery,
                                  textEditingController: ref.watch(
                                    textControllerProvider('deliveryLocation'),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.map),
                              SizedBox(
                                width: 10,
                              ),
                              Text('Pick location from google map'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width - 45,
                          child: TextField(
                            controller: ref.watch(
                              textControllerProvider('note'),
                            ),
                            maxLines: 6,
                            decoration: const InputDecoration(
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                          width: 150,
                          child: ElevatedButton(
                            onPressed: () {
                              if (deliveryTextController.text.isEmpty ||
                                  pickupTextController.text.isEmpty) {
                                return;
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DistanceBetweenTwoPoints()),
                                );
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : const SmallScreenSize();
  }
}
