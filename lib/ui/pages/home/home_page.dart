import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
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
            Consumer(
              builder: (context, ref, child) {
                final locations = ref.watch(homeViewModel);
                return Expanded(
                  child: ListView.builder(
                    itemCount: locations.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 191, 216, 178),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  locations[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  locations[index].category,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  locations[index].roadAddress,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
