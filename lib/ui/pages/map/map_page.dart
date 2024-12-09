import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

class MapPage extends StatelessWidget {
  String title;
  String address;
  MapPage({super.key, required this.title, required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              KakaoMapView(
                width: 400,
                height: 400,
                kakaoMapKey: '08eebe69029ef27e6209ec2d97b79d29',
                lat: 33.450701,
                lng: 126.570667,
                showZoomControl: true,
              ),
              SizedBox(height: 30),
              Text(
                '주소',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  address,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
