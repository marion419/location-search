import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/pages/detail/detail_page.dart';
import 'package:flutter_location_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_location_app/ui/pages/map/map_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationListView extends StatelessWidget {
  const LocationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        // 검색 결과를 저장할 리스트
        final locations = ref.watch(homeViewModel);
        return Expanded(
          child: ListView.builder(
            itemCount: locations.isNotEmpty ? locations.length : 1,
            itemBuilder: (context, index) {
              // locations 리스트가 빈 경우
              if (locations.isEmpty) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 200),
                  alignment: Alignment.center,
                  child: Text('검색 결과가 없습니다'),
                );
                // 검색 결과가 존재하는 경우
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      // 링크가 'https'로 시작하면 DetailPage로 이동
                      if (locations[index].link.startsWith('https')) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return DetailPage(locations[index]);
                          }),
                        );
                        // 링크 형식이 적절하지 않거나 없는 경우 스낵바 띄움
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('홈페이지가 존재하지 않습니다'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    // 리스트 박스 UI 구성
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, top: 20, bottom: 20, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  locations[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                // 지도 페이지 이동 버튼
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return MapPage(
                                          location: locations[index],
                                        );
                                      },
                                    ));
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.transparent,
                                    child: Icon(
                                      Icons.location_on,
                                      size: 25,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // 시설 분류
                            Text(
                              locations[index].category,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            // 시설 주소(도로명)
                            Text(
                              locations[index].roadAddress,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
