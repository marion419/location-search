import 'package:flutter/material.dart';
import 'package:flutter_location_app/data/model/location.dart';
import 'package:flutter_location_app/ui/pages/detail/detail_page.dart';
import 'package:flutter_location_app/ui/pages/map/widgets/information_box.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

class MapPage extends StatelessWidget {
  Location location;

  MapPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도 보기'),
        actions: [
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
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              KakaoMapView(
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
              ),
              SizedBox(height: 50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationBox(
                      title: '시설 이름',
                      information: location.title,
                    ),
                    SizedBox(height: 25),
                    InformationBox(
                      title: '주소',
                      information: location.roadAddress,
                    ),
                    SizedBox(height: 25),
                    InformationBox(
                      title: '시설 분류',
                      information: location.category,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
