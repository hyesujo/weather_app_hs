
import 'package:geo_app/model/location.dart';
import 'package:geo_app/model/networking.dart';

const apiKey = '478f890b1b45d2c56a66670ecae49938';
const openWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

Future<dynamic> getCityWeather(String cityName) async {
  NetworkHelper networkHelper =
  NetworkHelper('$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric');

 var weatherData =await networkHelper.getData();
 return weatherData;
}


 Future<dynamic> getAnotherCity(String cityName) async {
   NetworkHelper networkHelper = NetworkHelper(
  '$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric');

  var weatherData =await networkHelper.getData();
  return weatherData;
 }


Future<dynamic> getLocationWeather() async {
  Location location = Location();
   await location.getCurrentLocation();


   NetworkHelper networkHelper = NetworkHelper(
     '$openWeatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
 
   var wetherData = await networkHelper.getData();
   return wetherData;
}

String getWeatherImage(int condition) {
  if (condition < 300) {
    return 'assets/drizzle.png';
  } else if (condition < 400) {
    return 'assets/snow.png';
  } else if (condition < 600) {
    return 'assets/rain.png';
   } else if (condition < 700) {
     return 'assets/fog.png';
   } else if (condition < 800) {
      return 'assets/sun.png';
   }  else if (condition <= 804) {
      return 'assets/sun.png';
   } 
   else if (condition < 200) {
      return 'assets/Thunderstorm.png';
   } else {
     return 'assets/none.png';
   }
}
String getWBackgroundImage(int condition) {
  if (condition < 300) {
    return 'assets/drizzleback.jpg';
  } else if (condition < 400) {
    return 'assets/snowback.jpg';
  } else if (condition < 600) {
    return 'assets/rainback.jpg';
   } else if (condition < 700) {
     return 'assets/fogback.jpg';
   } else if (condition < 800) {
      return 'assets/travel1.jpg';
   } else if (condition <= 804) {
      return 'assets/sunback.jpg';
   } else if (condition < 200) {
      return 'assets/thunderback.jpg';
   } else {
     return 'assets/noneback.jpg';
   }
}


}