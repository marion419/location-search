import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/pages/home/widgets/location_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_location_app/ui/pages/home/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Consumer(
            builder: (context, ref, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextField(
                  onSubmitted: (value) {
                    if (value.trim().isNotEmpty) {
                      final viewModel = ref.read(homeViewModel.notifier);
                      viewModel.searchByLocation(value);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: '읍/면/동으로 검색하세요',
                  ),
                ),
              );
            },
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10),
            LocationListView(),
          ],
        ),
      ),
    );
  }
}
