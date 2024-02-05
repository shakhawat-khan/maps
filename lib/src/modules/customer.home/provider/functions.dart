import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/constants/constants.dart';
import 'package:pattern_m/src/modules/customer.home/modules/rider_list.dart';

import 'package:pattern_m/src/modules/customer.home/provider/home.provider.dart';

import '../../../providers/provider.dart';

// class BackendService {
//   static Future<List> getSuggestion(String query) async {
//     await Future.delayed(const Duration(seconds: 1));

//     return List.generate(
//         3,
//         (index) => {
//               'name': query + index.toString(),
//               'prince': Random().nextInt(100)
//             });
//   }
// }

Future<LatLng> getLocation(WidgetRef ref) async {
  LocationPermission permission;
  permission = await Geolocator.requestPermission();

  if (permission == LocationPermission.denied) {
    return Future.error('Location permissions are denied');
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  Position position;
  position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high,
  );

  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  ref.read(textControllerProvider('googleMapDataFromWhere')).text =
      ' ${placemarks.reversed.last.thoroughfare}, ${placemarks.reversed.last.subLocality}   ,${placemarks.reversed.last.administrativeArea}-${placemarks.reversed.last.postalCode} ,${placemarks.reversed.last.country}';

  //print(placemarks);

  return LatLng(position.latitude, position.longitude);
}

Future<String> getlocationAddress(LatLng latLng) async {
  List<Placemark> placemarks = await placemarkFromCoordinates(
    latLng.latitude,
    latLng.longitude,
  );

  return '${placemarks.reversed.last.thoroughfare} ${placemarks.reversed.last.subLocality}   ${placemarks.reversed.last.administrativeArea} ${placemarks.reversed.last.postalCode} ${placemarks.reversed.last.country}';
}

// void placeAutocomplete(String query) async {
//   Uri uri =
//       Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
//     'input': query,
//     'key': apiKey,
//   });

//   String? response = await NetworkUtility.fetchUrl(uri);

//   if (response != null) {
//     print(response);
//   }
// }

Future<List<LatLng>>? getSomePoints(WidgetRef ref) async {
  GoogleMapPolyline googleMapPolyline = GoogleMapPolyline(apiKey: apiKey);

  List<LatLng>? routeCoords =
      await googleMapPolyline.getCoordinatesWithLocation(
          origin: ref.watch(googleMapLatLngProviderPickup)!,
          destination: ref.watch(googleMapLatLngProviderDelivery)!,
          mode: RouteMode.driving);

  print(routeCoords!.length.toString());

  ref.read(polyLineListProvider.notifier).addState(routeCoords);

  ref
      .watch(changeMarkerProvider.notifier)
      .addMarker(routeCoords, 'Pickup point', routeCoords[0]);
  ref.watch(changeMarkerProvider.notifier).addMarker(
      routeCoords, 'Delivery point', routeCoords[routeCoords.length - 1]);

  return routeCoords;
}

Future<void> anotherScreen(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 4), () async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RidersList()));
  });
}





// class NetworkUtility {
//   static Future<String?> fetchUrl(Uri uri,
//       {Map<String, String>? headers}) async {
//     try {
//       final response = await http.get(uri, headers: headers);

//       if (response.statusCode == 200) {
//         return response.body;
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     }

//     return null;
//   }
// }
