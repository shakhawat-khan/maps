import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/modules/customer.home/provider/functions.dart';

import '../constants/constants.dart';
import '../modules/customer.home/provider/home.provider.dart';

Future<List<LatLng>>? getPolyLineListPickup(WidgetRef ref) async {
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: apiKey);

  final x = await getLocation(ref);

  List<LatLng>? routeCoords =
      await googleMapPolyline.getCoordinatesWithLocation(
    origin: x,
    destination: ref.watch(googleMapLatLngProviderPickup)!,
    mode: RouteMode.driving,
  );

  print(routeCoords!.length.toString());

  ref.read(polyLineListProvider.notifier).addState(routeCoords);

  return routeCoords;
}

Future<List<LatLng>>? getPolyLineListDelivery(WidgetRef ref) async {
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: apiKey);

  final x = await getLocation(ref);

  List<LatLng>? routeCoords =
      await googleMapPolyline.getCoordinatesWithLocation(
    origin: ref.watch(googleMapLatLngProviderPickup)!,
    destination: ref.watch(googleMapLatLngProviderDelivery)!,
    mode: RouteMode.driving,
  );

  print(routeCoords!.length.toString());

  ref.read(polyLineListProvider.notifier).addState(routeCoords);

  return routeCoords;
}
