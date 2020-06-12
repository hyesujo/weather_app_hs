import 'package:flutter/material.dart';
import 'package:geo_app/screen/loding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: LodingScreen(),
    );
  }
}
