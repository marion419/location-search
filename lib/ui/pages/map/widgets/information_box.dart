import 'package:flutter/material.dart';

class InformationBox extends StatelessWidget {
  String title;
  String information;

  InformationBox({
    super.key,
    required this.title,
    required this.information,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          information,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
