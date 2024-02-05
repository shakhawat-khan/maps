import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../providers/functions.dart';

class GooglemapLocation1 extends ConsumerWidget {
  final StateProvider<LatLng?> latlngProvider;
  const GooglemapLocation1({super.key, required this.latlngProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<LatLng>>(
      future: getPolyLineListPickup(ref),
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (snapshot.hasData) {
          return mapData(ref, latlngProvider, data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

Widget mapData(
    WidgetRef ref, StateProvider<LatLng?> latlngProvider, List<LatLng> latlng) {
  final Set<Polyline> polyline = {};

  polyline.add(
    Polyline(
        polylineId: const PolylineId('1'),
        points: latlng,
        visible: true,
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap),
  );

  return GoogleMap(
      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}
        ..add(Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
      initialCameraPosition:
          CameraPosition(target: ref.watch(latlngProvider)!, zoom: 14.5),
      polylines: polyline,
      markers: {
        Marker(
            markerId: const MarkerId('point'),
            position: ref.watch(latlngProvider)!),
      });
}
