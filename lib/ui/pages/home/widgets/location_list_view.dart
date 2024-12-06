import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/pages/detail/detail_page.dart';
import 'package:flutter_location_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationListView extends StatelessWidget {
  const LocationListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final locations = ref.watch(homeViewModel);
        return Expanded(
          child: ListView.builder(
            itemCount: locations.isNotEmpty ? locations.length : 1,
            itemBuilder: (context, index) {
              if (locations.isEmpty) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 200),
                  alignment: Alignment.center,
                  child: Text('검색 결과가 없습니다'),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              link: locations[index].link,
                              title: locations[index].title,
                            ),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //border: Border.all(color: Colors.grey[700]!),
                        color: Colors.grey[200],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
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
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
