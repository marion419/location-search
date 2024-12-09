import 'package:flutter/material.dart';
import 'package:flutter_location_app/data/model/location.dart';
import 'package:flutter_location_app/ui/pages/detail/detail_page.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

class KaKaoMap extends StatelessWidget {
  const KaKaoMap({
    super.key,
    required this.location,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    return KakaoMapView(
      width: double.infinity,
      height: 400,
      kakaoMapKey: '08eebe69029ef27e6209ec2d97b79d29',
      lat: double.parse(location.latitude) / 10000000,
      lng: double.parse(location.longitude) / 10000000,
      showZoomControl: true,
      onTapMarker: (p0) {
        if (location.link.startsWith('https')) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DetailPage(location);
              },
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('홈페이지가 존재하지 않습니다'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
    );
  }
}
