import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: TextField(
            decoration: InputDecoration(
              hintText: '읍/면/동으로 검색하세요',
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 191, 216, 178),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '삼성 1동 주민센터',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '공공, 사회기관 > 행정복지센터',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text('서울특별시 강남구 봉은사로 616 삼성1동 주민센터'),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
