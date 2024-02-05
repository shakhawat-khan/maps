import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../constants/constants.dart';

final timerProvider =
    NotifierProvider<TimerNotifier, String>(TimerNotifier.new);

class TimerNotifier extends Notifier<String> {
  @override
  build() {
    return 'available';
  }

  void changeRequest() {
    state = 'No Longer Available';
  }
}

final countProvider = NotifierProvider<CountNotifier, int>(CountNotifier.new);

class CountNotifier extends Notifier<int> {
  @override
  build() {
    return 10;
  }

  void changeRequest(int value) {
    state = value;
  }
}

final locationProvider =
    NotifierProvider<LocationNotifier, LatLng?>(LocationNotifier.new);

class LocationNotifier extends Notifier<LatLng?> {
  @override
  build() {
    return const LatLng(lat, long);
  }

  void changeCurrentLocation(LatLng latLng) {
    state = latLng;
  }
}
