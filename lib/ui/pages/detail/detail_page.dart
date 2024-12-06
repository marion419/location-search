import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_location_app/data/model/location.dart';

class DetailPage extends StatelessWidget {
  Location location;

  DetailPage(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri(location.link),
        ),
      ),
    );
  }
}
