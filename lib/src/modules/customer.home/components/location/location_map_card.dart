import 'package:flutter/material.dart';

class LocationMapCard extends StatelessWidget {
  const LocationMapCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () {},
        child: Card(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Icon(Icons.map),
            Text('Select Locaton From Map'),
          ]),
        ),
      ),
    );
  }
}
