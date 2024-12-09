import 'package:flutter_location_app/data/model/location.dart';
import 'package:flutter_location_app/data/repository/location_repository.dart';
import 'package:flutter_location_app/data/repository/vworld_repository.dart';
import 'package:riverpod/riverpod.dart';

class HomeViewModel extends AutoDisposeNotifier<List<Location>> {
  @override
  List<Location> build() {
    return [];
  }

  final locationRepository = LocationRepository();

  Future<void> searchByLocation(String query) async {
    state = await locationRepository.findByLocation(query);
  }

  Future<void> searchByLatLng(double lat, double lng) async {
    final query = await VworldRepository().findDistrict(lat, lng);
    state = await locationRepository.findByLocation(query.toString().trim());
  }
}

final homeViewModel =
    NotifierProvider.autoDispose<HomeViewModel, List<Location>>(
        () => HomeViewModel());
