import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

class MapPage extends StatelessWidget {
  String address;
  MapPage({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(address),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            KakaoMapView(
                width: 400,
                height: 400,
                kakaoMapKey: '08eebe69029ef27e6209ec2d97b79d29',
                lat: 33.450701,
                lng: 126.570667,
                showMapTypeControl: true,
                showZoomControl: true,
                markerImageURL:
                    'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                onTapMarker: (message) {
                  //event callback when the marker is tapped
                }),
          ],
        ),
      ),
    );
  }
}
