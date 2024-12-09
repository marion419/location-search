import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

class MapPage extends StatelessWidget {
  String title;
  String address;
  String lat;
  String lng;
  MapPage({
    super.key,
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
  });

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
            children: [
              SizedBox(height: 50),
              KakaoMapView(
                width: 400,
                height: 400,
                kakaoMapKey: '08eebe69029ef27e6209ec2d97b79d29',
                lat: double.parse(lat) / 10000000,
                lng: double.parse(lng) / 10000000,
                showZoomControl: true,
              ),
              SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '주소',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
