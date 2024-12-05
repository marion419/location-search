import 'package:flutter_location_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final locationRepo = LocationRepository();
  test('locationTest', () async {
    final result = await locationRepo.findByLocation('삼성동');
    expect(result.isEmpty, false);
  });
}
