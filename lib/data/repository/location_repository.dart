import 'package:dio/dio.dart';
import 'package:flutter_location_app/data/model/location.dart';

class LocationRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  Future<List<Location>> findByLocation(String query) async {
    final response = await _client.get(
      'https://openapi.naver.com/v1/search/local.json',
      queryParameters: {
        'query': query,
        'display': 5,
      },
      options: Options(headers: {
        'X-Naver-Client-Id': 'IX_0bt2rQvXCiIt_mT8B',
        'X-Naver-Client-Secret': 'iCjJ6lN0Ga',
      }),
    );
    try {
      // 응답 코드가 200인 경우 받은 데이터로 list 생성
      // 데이터 경로 : items >> title/category/
      if (response.statusCode == 200) {
        final items = response.data['items'];
        final iterable = List.from(items).map((e) {
          return Location.fromJson(e);
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
