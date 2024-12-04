import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
              hintText: '읍/면/동으로 검색하세요',
            ),
          ),
        ),
      ),
    );
  }
}
