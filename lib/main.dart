import 'package:flutter/material.dart';
import 'package:geo_app/Provider/update_wearher.dart';
import 'package:geo_app/screen/loding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UpdateWeather(),
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: LodingScreen(),
      ),
    );
  }
}
