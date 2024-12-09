import 'package:dio/dio.dart';
import 'package:flutter_location_app/data/model/location.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  Future<List<String>> findDistrict(double lat, double lng) async {
    try {
      final response = await _client.get(
        'https://api.vworld.kr/req/data',
        queryParameters: {
          'request': 'GetFeature',
          'key': 'DB7D3ACC-ABA6-357F-B0DE-D5C915CE71B5',
          'data': 'LT_C_ADEMD_INFO',
          'geomFilter': 'POINT($lng $lat)',
          'geometry': false,
        },
      );

      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        final features = response.data['response']['result']
            ['featureCollection']['features'];
        final featureList = List.from(features);
        final iterable = featureList.map((feat) {
          return '${feat['properties']['emd_kor_nm']}';
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
