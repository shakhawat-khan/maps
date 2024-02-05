import 'package:flutter/material.dart';

import '../../../../components/map/googlemap_location_rider_route.dart';
import '../../../customer.home/provider/home.provider.dart';

class ConfrimPickup extends StatelessWidget {
  const ConfrimPickup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm delivery')),
      body: Column(
        children: [
          Expanded(
            child: GooglemapLocation1(
              latlngProvider: googleMapLatLngProviderDelivery,
            ),
          ),
        ],
      ),
    );
  }
}
