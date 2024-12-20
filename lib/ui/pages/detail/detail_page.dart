import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_location_app/data/model/location.dart';

class DetailPage extends StatelessWidget {
  final Location location;

  const DetailPage(this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        actions: [
          // 홈페이지로 이동하는 버튼
          Container(
            padding: EdgeInsets.only(right: 30),
            width: 50,
            height: 50,
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                while (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Icon(
                Icons.home,
                size: 25,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      // inappwebview
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(location.link),
        ),
      ),
    );
  }
}
