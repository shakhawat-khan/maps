import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/providers/provider.dart';

Future<void> getSomePointsLiveTraking(WidgetRef ref) async {
//  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: apiKey);

  // Location location = Location();

  // bool serviceEnabled;
  // PermissionStatus permissionGranted;
  // LocationData locationData;

  // serviceEnabled = await location.serviceEnabled();
  // if (!serviceEnabled) {
  //   serviceEnabled = await location.requestService();
  //   if (!serviceEnabled) {
  //     print('object');
  //   }
  // }

  // permissionGranted = await location.hasPermission();
  // if (permissionGranted == PermissionStatus.denied) {
  //   permissionGranted = await location.requestPermission();
  //   if (permissionGranted != PermissionStatus.granted) {
  //     print('object');
  //   }
  // }

  // locationData = await location.getLocation();

  // print(locationData.latitude);

  // final location = await getLocation();

  // print('Location: ${location.latitude}, ${location.longitude}');

  // var positionStream =
  //     Geolocator.getPositionStream().listen((Position position) {
  //   ref
  //       .read(liveLocationProvider.notifier)
  //       .giveLatlng(LatLng(position.latitude, position.longitude));

  //   // print(position.latitude.toString() + '+' + position.longitude.toString());
  // });

  return;
}
