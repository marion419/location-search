import 'package:flutter/material.dart';

// MapPage에 정보 보여주는 위젯
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
        Row(
          children: [
            Icon(Icons.check),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          information,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
          ),
        ),
      ],
    );
  }
}
