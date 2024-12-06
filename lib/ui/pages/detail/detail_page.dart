import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String link;

  DetailPage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Text(link);
  }
}
