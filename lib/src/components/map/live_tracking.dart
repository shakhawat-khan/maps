import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:pattern_m/src/providers/provider.dart';

import '../../modules/customer.home/provider/home.provider.dart';

class LiveTracking extends ConsumerWidget {
  const LiveTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('distance between two points'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(streamSubProvider).pause();
            Navigator.pop(context);
            ref.read(durationProvider).cancel();
            //ref.read(liveLocationTestProvider).clear();
          },
        ),
      ),
      body: Stack(
        children: const [
          LiveTrackingGoogleMapview(),
        ],
      ),
    );
  }
}

//final stream = Geolocator.getPositionStream();

class LiveTrackingGoogleMapview extends ConsumerWidget {
  const LiveTrackingGoogleMapview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ref.read(streamSubProvider).resume();
    final Set<Polyline> polyline = {};
    // markers.add(
    //   Marker(
    //     markerId: const MarkerId('dfa'),
    //     position: ref.watch(liveLocationProvider),
    //   ),
    // );

    // Future(() {
    //   ref.read(liveLocationTestProvider.notifier).liveLocationMarker(
    //         Marker(
    //           markerId: const MarkerId('live'),
    //           position: ref.read(liveLocationProvider),
    //         ),
    //       );
    // });
    ref.read(streamSubProvider).resume();
    print('stream on');

    ref.read(durationProvider);

    //   Timer t = Timer(Duration(seconds: 1), () {

    //      ref.read(streamSubProvider).resume();
    //     ref.read(liveLocationTestProvider.notifier).liveLocationMarker(
    //           Marker(
    //             markerId: const MarkerId('live'),
    //             position: ref.read(liveLocationProvider),
    //           ),
    //         );

    // });

    // Future.delayed(const Duration(seconds: 1), () {
    //   ref.read(streamSubProvider).resume();
    //   ref.read(liveLocationTestProvider.notifier).liveLocationMarker(
    //         Marker(
    //           markerId: const MarkerId('live'),
    //           position: ref.read(liveLocationProvider),
    //         ),
    //       );

    // });

    // ref.watch(liveLocationTestProvider.notifier).liveLocationMarker(
    //       Marker(
    //         markerId: const MarkerId('live'),
    //         position: ref.watch(liveLocationProvider),
    //       ),
    //     );

    polyline.add(
      Polyline(
        polylineId: const PolylineId('1'),
        points: ref.watch(polyLineListProvider),
        visible: true,
        width: 4,
        color: Colors.blue,
        startCap: Cap.roundCap,
        endCap: Cap.buttCap,
      ),
    );

    return Stack(
      children: [
        GoogleMap(
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
              Factory<EagerGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            ),
          zoomGesturesEnabled: true,
          polylines: polyline,
          markers: ref.watch(liveLocationTestProvider),
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: ref.watch(liveLocationProvider)!,
            zoom: 11,
          ),
        ),
      ],
    );
  }
}
