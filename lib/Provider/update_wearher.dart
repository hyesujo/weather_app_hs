import 'package:flutter/material.dart';
import 'package:geo_app/model/wether.dart';


class UpdateWeather with ChangeNotifier {
  
  WeatherModel weathers = WeatherModel();
  int temperature;
  dynamic weatherImage;
  String city;
  dynamic weatherBack;
 
   Future<void> updateUi(dynamic weatherData) async {
    double temp =await weatherData['main']['temp'].toDouble();
     temperature = temp.toInt();
     var condition =await weatherData['weather'][0]['id'];
    weatherBack = weathers.getWBackgroundImage(condition);
    weatherImage = weathers.getWeatherImage(condition);
    city = weatherData['name'];
    notifyListeners();
}
}