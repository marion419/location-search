import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  String address;
  MapPage({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
    );
  }
}
