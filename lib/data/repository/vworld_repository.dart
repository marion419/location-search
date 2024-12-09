import 'package:dio/dio.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  Future<String> findDistrict(String lat, String lng) async {
    final response = await _client.get(
      'https://api.vworld.kr/req/data',
      queryParameters: {
        'request': 'GetFeature',
        'key': 'DB7D3ACC-ABA6-357F-B0DE-D5C915CE71B5',
        'data': 'LT_C_ADEMD_INFO',
        'geomfilter': 'POINT($lng $lat)',
        'geometry': 'false',
      },
    );
    try {
      if (response.statusCode == 200 &&
          response.data['response']['status'] == 'OK') {
        return response.data['response']['result']['features']['properties']
            ['emd_kor_nm'];
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }
}
