import 'package:flutter/material.dart';
import 'package:pattern_m/src/components/map/googlemap_view.dart';

class UserToDeliveryman extends StatelessWidget {
  const UserToDeliveryman({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery man details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Icon(
                              Icons.person,
                              size: 100,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Name: Api data name'),
                              Text('Phone Number: API phone NUmber'),
                              Text('Email: API Email'),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text('Live Tracking'),
              const SizedBox(
                height: 10,
              ),
              const GoogleMapView(heightSize: 60),
              const SizedBox(
                height: 10,
              ),
              const Text('Time needed from PickUp point'),
              const Text('_ _ : _ _'),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Service charge will be'),
                  SizedBox(
                    width: 10,
                  ),
                  Text('100 Taka'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Confirm Service'))
            ],
          ),
        ),
      ),
    );
  }
}
