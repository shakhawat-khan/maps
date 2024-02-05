import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:pattern_m/src/modules/customer.home/modules/looking_for_riders.dart';
import 'package:pattern_m/src/providers/provider.dart';

import '../../../modules/customer.home/provider/functions.dart';

class DistanceBetweenTwoPoints extends ConsumerWidget {
  const DistanceBetweenTwoPoints({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('distance between two points'),
      ),
      body: Stack(
        children: [
          const GoogleMapviewTwoPoints(),
          Positioned(
            bottom: 50,
            left: 70,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LookingForRiders(),
                  ),
                );
              },
              child: const Text('Confrim pickup and Delivery point'),
            ),
          )
        ],
      ),
    );
  }
}

class GoogleMapviewTwoPoints extends ConsumerWidget {
  const GoogleMapviewTwoPoints({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<LatLng>>(
      future: getSomePoints(ref),
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (snapshot.hasData) {
          return DistanceTwoPoints(
            latLng: data!,
          );
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

class DistanceTwoPoints extends ConsumerWidget {
  final List<LatLng> latLng;
  const DistanceTwoPoints({
    required this.latLng,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Set<Polyline> polyline = {};

    print('call hocche distance');
    polyline.add(
      Polyline(
          polylineId: const PolylineId('1'),
          points: latLng,
          visible: true,
          width: 4,
          color: Colors.blue,
          startCap: Cap.roundCap,
          endCap: Cap.buttCap),
    );

    return Stack(
      children: [
        GoogleMap(
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}..add(
              Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer())),
          zoomGesturesEnabled: true,
          polylines: polyline,
          markers: ref.watch(changeMarkerProvider),
          myLocationButtonEnabled: true,
          initialCameraPosition: CameraPosition(
            target: latLng[0],
            zoom: 11,
          ),
        ),
      ],
    );
  }
}
