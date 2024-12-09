import 'package:flutter/material.dart';
import 'package:flutter_location_app/core/geolocator_helper.dart';
import 'package:flutter_location_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSearchBar extends StatefulWidget {
  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        //padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.grey[500]!,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: 10),
            Icon(Icons.search, color: Theme.of(context).colorScheme.secondary),
            SizedBox(width: 10),
            Container(
              width: 2,
              height: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(width: 10),
            Flexible(
              child: Consumer(
                builder: (context, ref, child) {
                  return TextField(
                    controller: textEditingController,
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
                      String district = await viewModel.searchByLatLng(
                          currentLocation.latitude, currentLocation.longitude);
                      textEditingController.text = district;
                    }
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.gps_fixed,
                      color: Theme.of(context).colorScheme.primary,
                    ),
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
