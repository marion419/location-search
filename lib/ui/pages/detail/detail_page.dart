import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String link;
  String title;

  DetailPage({super.key, required this.link, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(),
    );
  }
}
