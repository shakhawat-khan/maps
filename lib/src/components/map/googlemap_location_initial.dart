import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../modules/customer.home/provider/functions.dart';

class GooglemapLocation extends ConsumerWidget {
  final StateProvider<LatLng?> latlngProvider;
  const GooglemapLocation({super.key, required this.latlngProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<LatLng>(
      future: getLocation(ref),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.hasData) {
          print('has data');
          return mapData(data!, ref, latlngProvider);
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
    LatLng latLng, WidgetRef ref, StateProvider<LatLng?> latlngProvider) {
  return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: ref.watch(latlngProvider)!, zoom: 14.5),
      markers: {
        Marker(
            markerId: const MarkerId('point'),
            position: ref.watch(latlngProvider)!),
      });
}
