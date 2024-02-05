import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/constants.dart';

import 'package:label_marker/label_marker.dart';

final liveLocationProvider = NotifierProvider<StreamLocationNotifier, LatLng>(
    StreamLocationNotifier.new);

class StreamLocationNotifier extends Notifier<LatLng> {
  @override
  LatLng build() {
    return const LatLng(lat, long);
  }

  void giveLatlng(LatLng latLng) {
    state = latLng;
    print(latLng);
  }
}

final streamSubProvider =
    NotifierProvider<StreamSubNotifier, StreamSubscription<Position>>(
        StreamSubNotifier.new);

class StreamSubNotifier extends Notifier<StreamSubscription<Position>> {
  @override
  StreamSubscription<Position> build() {
    return Geolocator.getPositionStream().listen((event) {
      ref
          .read(liveLocationProvider.notifier)
          .giveLatlng(LatLng(event.latitude, event.longitude));
    });
  }
}

final changeMarkerProvider =
    NotifierProvider<MarkerNotifier, Set<Marker>>(MarkerNotifier.new);

class MarkerNotifier extends Notifier<Set<Marker>> {
  @override
  Set<Marker> build() {
    return {};
  }

  void addMarker(List<LatLng> latLng, String markerId, LatLng position) async {
    final x = await state.addLabelMarkerExt(
      LabelMarker(
          label: markerId, markerId: MarkerId(markerId), position: position),
    );
    if (x == null) return;
    state = {...state, x};

    ref.read(liveLocationTestProvider.notifier).addPathMarkerSet(state);
  }
}

final liveLocationTestProvider =
    NotifierProvider<LiveLocationNotifierTest, Set<Marker>>(
        LiveLocationNotifierTest.new);

class LiveLocationNotifierTest extends Notifier<Set<Marker>> {
  @override
  Set<Marker> build() {
    return {};
  }

  void addPathMarkerSet(Set<Marker> test) {
    state = test;
  }

  void liveLocationMarker(Marker marker) {
    state = {...state, marker};
    print('live location yo');
  }
}

extension AddExtension on Set<Marker> {
  Future<Marker?> addLabelMarkerExt(LabelMarker labelMarker) async {
    Marker? result;
    await createCustomMarkerBitmap(
      labelMarker.label,
      backgroundColor: labelMarker.backgroundColor,
      textStyle: labelMarker.textStyle,
    ).then((value) {
      final x = Marker(
          markerId: labelMarker.markerId,
          position: labelMarker.position,
          icon: value,
          alpha: labelMarker.alpha,
          anchor: labelMarker.anchor,
          consumeTapEvents: labelMarker.consumeTapEvents,
          draggable: labelMarker.draggable,
          flat: labelMarker.flat,
          infoWindow: labelMarker.infoWindow,
          rotation: labelMarker.rotation,
          visible: labelMarker.visible,
          zIndex: labelMarker.zIndex,
          onTap: labelMarker.onTap,
          onDragStart: labelMarker.onDragStart,
          onDrag: labelMarker.onDrag,
          onDragEnd: labelMarker.onDragEnd);
      add(x);
      result = x;
    });
    return (result);
  }
}

final durationProvider =
    NotifierProvider<DurationNotifier, Timer>(DurationNotifier.new);

class DurationNotifier extends Notifier<Timer> {
  @override
  Timer build() {
    return Timer(const Duration(seconds: 1), () {
      ref.read(liveLocationTestProvider.notifier).liveLocationMarker(
            Marker(
              markerId: const MarkerId('live'),
              position: ref.watch(liveLocationProvider),
            ),
          );
    });
  }
}
