import 'package:flutter_location_app/data/model/location.dart';
import 'package:flutter_location_app/data/repository/location_repository.dart';
import 'package:flutter_location_app/data/repository/vworld_repository.dart';
import 'package:riverpod/riverpod.dart';

// ViewModel
// 상태 클래스는 List<Location>으로 대체
class HomeViewModel extends AutoDisposeNotifier<List<Location>> {
  @override
  List<Location> build() {
    return [];
  }

  final locationRepository = LocationRepository();

  Future<void> searchByLocation(String query) async {
    state = await locationRepository.findByLocation(query);
  }

  Future<String> searchByLatLng(double lat, double lng) async {
    final query = await VworldRepository().findDistrict(lat, lng);
    state = await locationRepository.findByLocation(query[0]);
    return query[0];
  }
}

// Provider
final homeViewModel =
    NotifierProvider.autoDispose<HomeViewModel, List<Location>>(
        () => HomeViewModel());
