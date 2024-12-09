import 'package:flutter/material.dart';
import 'package:flutter_location_app/data/model/location.dart';
import 'package:flutter_location_app/ui/pages/map/widgets/information_box.dart';
import 'package:flutter_location_app/ui/pages/map/widgets/kakaomap.dart';

class MapPage extends StatelessWidget {
  Location location;

  MapPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도 보기'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              // 맵 마커 안내문구
              Text(
                '맵 마커를 클릭하면 웹 사이트로 이동합니다',
                style: TextStyle(color: Colors.grey[800]),
              ),
              SizedBox(height: 20),
              // 지도 위젯
              KaKaoMap(location: location),
              // 정보 텍스트
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 시설 이름
                    InformationBox(
                      title: '시설 이름',
                      information: location.title,
                    ),
                    SizedBox(height: 25),
                    // 주소
                    InformationBox(
                      title: '주소',
                      information: location.roadAddress,
                    ),
                    SizedBox(height: 25),
                    // 시설 분류
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
