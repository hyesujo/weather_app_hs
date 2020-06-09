
import 'package:flutter/material.dart';
import 'package:geo_app/model/wether.dart';
import 'package:geo_app/screen/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LodingScreen extends StatefulWidget {
  @override
  _LodingScreenState createState() => _LodingScreenState();
}



class _LodingScreenState extends State<LodingScreen> {

  double latitude;
  double longitude;

@override
  void initState() {
   _getCurrnetLocationData();
    super.initState();
  }

 void _getCurrnetLocationData() async {
   
  WeatherModel weatherModel = WeatherModel();
  var weatherData =await  weatherModel.getLocationWeather();
   
 
   Navigator.push(context, MaterialPageRoute(builder: (context)  {
   return LocationScreen(locationWeather: weatherData);
   }));
 }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
     child: SpinKitDoubleBounce(
       color: Colors.deepOrange,
       size: 50,
     ),
      ),
    );
  }
}

 