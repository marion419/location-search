import 'package:flutter/material.dart';
import 'package:flutter_location_app/core/geolocator_helper.dart';
import 'package:flutter_location_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Icon(
              Icons.search,
              color: Colors.grey[400],
            ),
            SizedBox(width: 10),
            Container(
              width: 2,
              height: 20,
              color: Colors.grey[400],
            ),
            SizedBox(width: 10),
            Flexible(
              child: Consumer(
                builder: (context, ref, child) {
                  return TextField(
                    onSubmitted: (value) {
                      if (value.trim().isNotEmpty) {
                        final viewModel = ref.read(homeViewModel.notifier);
                        viewModel.searchByLocation(value);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '읍/면/동으로 검색해주세요',
                    ),
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () async {
                    final currentLocation =
                        await GeolocatorHelper.getPosition();
                    if (currentLocation != null) {
                      final viewModel = ref.read(homeViewModel.notifier);
                      viewModel.searchByLatLng(
                          currentLocation.latitude, currentLocation.longitude);
                    }
                    print('tap');
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(Icons.gps_fixed),
                  ),
                );
              },
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
