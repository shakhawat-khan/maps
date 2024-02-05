import 'package:flutter/material.dart';

class GoogleMapView extends StatelessWidget {
  final double heightSize;
  const GoogleMapView({
    required this.heightSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Image(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/gmap.png'),
      ),
    );
  }
}
