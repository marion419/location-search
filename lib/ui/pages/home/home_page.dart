import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_location_app/ui/pages/home/widgets/home_search_bar.dart';
import 'package:flutter_location_app/ui/pages/home/widgets/location_list_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        //appBar: AppBar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('지역 검색'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeSearchBar(),
            LocationListView(),
          ],
        ),
      ),
    );
  }
}
