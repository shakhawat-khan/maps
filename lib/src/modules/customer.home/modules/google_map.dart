import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/modules/customer.home/provider/functions.dart';
import 'package:pattern_m/src/modules/customer.home/provider/home.provider.dart';

import '../../../constants/constants.dart';

import 'package:search_map_place_updated/search_map_place_updated.dart';

class GoogleMapTest extends ConsumerWidget {
  final TextEditingController textEditingController;
  final StateProvider<LatLng?> latlangProvider;
  GoogleMapTest(
      {super.key,
      required this.textEditingController,
      required this.latlangProvider});

  //static const LatLng sourceLocation = LatLng(23.784815, 90.4163723);
  late final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Completer<GoogleMapController> _controller = Completer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SearchMapPlaceWidget(
              bgColor: Colors.white,
              textColor: Colors.black,

              apiKey: apiKey,
              // The language of the autocompletion
              language: 'en',
              // The position used to give better recomendations. In this case we are using the user position

              location: const LatLng(lat, long),
              radius: 30000,
              onSelected: (Place place) async {
                final geolocation = await place.geolocation;

                if (geolocation == null) {
                  return;
                }

                // ref
                //     .read(moveCameraLocationProvider.notifier)
                //     .update((state) => geolocation);

                LatLng test = geolocation.coordinates;

                ref
                    .read(moveCameraLatlngProvider.notifier)
                    .update((state) => test);

                ref.read(latlangProvider.notifier).update((state) => test);

                ref.read(tempMarkerProvider.notifier).update((state) => test);

                // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom

                //final GoogleMapController controller = await _mapController.future;

                final GoogleMapController controller = await _controller.future;

                //print(controller. + '0000000000000');

                controller.animateCamera(
                    CameraUpdate.newLatLng(geolocation.coordinates));

                controller.animateCamera(
                    CameraUpdate.newLatLngBounds(geolocation.bounds, 0));

                //print(DateTime(1).microsecondsSinceEpoch);
              },
            ),
          ),

          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   child: SearchLocation(
          //     apiKey: apiKey,
          //     // The language of the autocompletion
          //     language: 'en',
          //     //Search only work for this specific country
          //     country: 'BD',
          //     onSelected: (Place place) async {
          //       final geolocation = await place.geolocation;

          //       print(geolocation);

          //       // Will animate the GoogleMap camera, taking us to the selected position with an appropriate zoom
          //     },
          //   ),
          // ),
          Flexible(
            child: FutureBuilder<LatLng>(
              future: getLocation(ref),
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (snapshot.hasData) {
                  return mapData(data!, ref, textEditingController,
                      latlangProvider, _controller);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ref.read(tempMarkerProvider.notifier).update((state) => null);

          if (ref.read(latlangProvider) == null &&
              textEditingController.text.isEmpty) {
            final temp = await getLocation(ref);
            ref.read(latlangProvider.notifier).update((state) => temp);
            textEditingController.text = await getlocationAddress(temp);
          } else {
            textEditingController.text =
                await getlocationAddress(ref.read(latlangProvider)!);
          }

          // ignore: use_build_context_synchronously
          Navigator.pop(context);
        },
        child: const Icon(Icons.location_city_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

Widget mapData(
  LatLng latLng,
  WidgetRef ref,
  TextEditingController textEditingController,
  StateProvider<LatLng?> latlngProvider,
  Completer<GoogleMapController> test,
) {
  //Completer<GoogleMapController> _controllertemp = Completer();
  return Stack(
    children: [
      GoogleMap(
        onMapCreated: (controller) async {
          //GoogleMapController controller = await _controllertemp.future;

          // controller.animateCamera(CameraUpdate.newLatLng(
          //     ref.read(moveCameraLocationProvider)!.coordinates));

          // controller.animateCamera(
          //     CameraUpdate.newLatLngBounds(ref.read(moveCameraLocationProvider)!.bounds, 0));
          test.complete(controller);

          //ref.watch(googlemapControllerProvider).complete(controller);
          // if (ref.watch(googlemapControllerProvider).isCompleted) {
          //   //first calling is false
          //   //call "completer()"
          //   ref.watch(googlemapControllerProvider).complete(controller);
          // }
        },
        initialCameraPosition: CameraPosition(
          target: ref.watch(latlngProvider) == null
              ? latLng
              : ref.watch(latlngProvider)!,
          zoom: 14.5,
        ),
        markers: {
          Marker(
            onTap: () {
              print('object');
            },
            draggable: true,
            markerId: const MarkerId('source'),
            position: ref.watch(latlngProvider) == null
                ? latLng
                : ref.watch(latlngProvider)!,
            onDragEnd: (value) async {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                value.latitude,
                value.longitude,
              );
              textEditingController.text =
                  ' ${placemarks.reversed.last.thoroughfare}, ${placemarks.reversed.last.subLocality}   ,${placemarks.reversed.last.administrativeArea} ,${placemarks.reversed.last.postalCode} ,${placemarks.reversed.last.country}';
              // // placemarks.toString();
              // ref
              //     .read(googleMapLatLngProvider.notifier)
              //     .update((state) => LatLng(value.latitude, value.longitude));

              ref.read(latlngProvider.notifier).update(
                    (state) => LatLng(value.latitude, value.longitude),
                  );

              print(latLng);
            },
          ),
        },
      ),
    ],
  );
}
