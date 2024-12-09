import 'dart:convert';
import 'package:flutter_location_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('location model test', () {
    String dummyData = """
{
  "title": "title",
  "category": "category",
  "roadAddress": "roadAddress",
  "link": "link",
  "mapx": "1.0",
  "mapy": "1.0"
}
""";

    Map<String, dynamic> map = jsonDecode(dummyData);
    Location location = Location.fromJson(map);
    expect(location.title, 'title');
    print(location.link);
  });
}
