import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pattern_m/src/constants/constants.dart';

final boolLoding = StateProvider<bool?>((ref) {
  return null;
});

final listTextfield = StateProvider<List<String>?>(
  (ref) {
    return null;
  },
);

final destinationLocation = StateProvider<int?>(
  (ref) {
    return null;
  },
);

final googleMapLatLngProviderPickup = StateProvider<LatLng?>((ref) {
  return null;
});

final googleMapLatLngProviderDelivery = StateProvider<LatLng?>((ref) {
  return null;
});

final tempMarkerProvider = StateProvider<LatLng?>((ref) {
  return null;
});

final textControllerProvider =
    Provider.family((_, String __) => TextEditingController());

final googleMapTextController = Provider<TextEditingController?>((ref) {
  return TextEditingController();
});

final dropDownProvider1 = StateProvider<String>((ref) {
  return 'Cities';
});

final dropDownMenuItemProvider =
    StateProvider<List<DropdownMenuItem<String>>?>((ref) {
  return null;
});

final dropDownProvider2 = StateProvider<String>((ref) {
  return 'Area';
});

//List<DropdownMenuItem<String>> menuitems = [];

//Completer<GoogleMapController> _controller = Completer();

final googlemapControllerProvider =
    Provider<Completer<GoogleMapController>>((ref) {
  return Completer();
});

final moveCameraLatlngProvider = StateProvider<LatLng>((ref) {
  return const LatLng(lat, long);
});

// final moveCameraLocationProvider = StateProvider<Geolocation>((ref) {
//   return ;
// });

final polyLineListProvider =
    NotifierProvider<RouteCoordsNotifier, List<LatLng>>(
        RouteCoordsNotifier.new);

class RouteCoordsNotifier extends Notifier<List<LatLng>> {
  @override
  List<LatLng> build() {
    return [];
  }

  void addState(List<LatLng> t) {
    state = t;
  }
}
