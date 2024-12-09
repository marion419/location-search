import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/pages/home/widgets/home_search_bar.dart';
import 'package:flutter_location_app/ui/pages/home/widgets/location_list_view.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Location Search',
            style: TextStyle(
                fontFamily: "Inter",
                fontWeight: FontWeight.w100,
                color: Theme.of(context).primaryColor),
          ),
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
