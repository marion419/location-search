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
              SizedBox(height: 50),
              KaKaoMap(location: location),
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
