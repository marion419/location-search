import 'package:flutter_location_app/data/repository/location_repository.dart';
import 'package:flutter_location_app/data/repository/vworld_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('locationTest', () async {
    LocationRepository locationRepo = LocationRepository();
    final result = await locationRepo.findByLocation('삼성동');
    expect(result.isEmpty, false);
    for (var loca in result) {
      print(loca.latitude);
    }
  });

  final vWorldRepo = VworldRepository();
  test('latlng', () async {
    final result = await vWorldRepo.findDistrict(35.2210076, 129.0826365);
    expect(result.isEmpty, false);
    print(result);
    final result2 = await vWorldRepo.findDistrict(30.2210076, 129.0826365);
    expect(result2.isEmpty, true);
  });
}
