import 'package:flutter/material.dart';
import 'package:flutter_location_app/ui/pages/home/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
            border: InputBorder.none
            // border: MaterialStateOutlineInputBorder.resolveWith((states) {
            //   if (states.contains(WidgetState.focused)) {
            //     return OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(10),
            //       borderSide: BorderSide(
            //         color: Colors.black,
            //         width: 2,
            //       ),
            //     );
            //   }
            //   return OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(10),
            //     borderSide: BorderSide(
            //       color: Colors.grey[300]!,
            //       width: 2,
            //     ),
            //   );
            // }),
            ),
      ),
      home: HomePage(),
    );
  }
}
