import 'package:flutter/material.dart';

class SmallScreenSize extends StatelessWidget {
  const SmallScreenSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar'),
      ),
      body: const Center(
        child: Text('screen size is so small'),
      ),
    );
  }
}
