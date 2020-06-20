import 'package:flutter/material.dart';
import 'package:geo_app/Provider/update_wearher.dart';
import 'package:geo_app/const.dart';
import 'package:geo_app/model/wether.dart';
import 'package:geo_app/view/navigator_dawer.dart';
import 'package:provider/provider.dart';

class LocationScreen extends StatelessWidget {
  static const routeName = '/lacation';
  final locationWeather;
  final WeatherModel weathers = WeatherModel();

  LocationScreen({Key key, this.locationWeather});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpdateWeather>(
      create: (context) => UpdateWeather()..updateUi(locationWeather),
      child: Consumer<UpdateWeather>(
        builder: (context, weather, _) => Scaffold(
            body: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    image: DecorationImage(
                        image: AssetImage(weather.weatherBack),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        fit: BoxFit.cover),
                  ),
                  constraints: BoxConstraints.expand(),
                  padding: EdgeInsets.only(top: 200),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        weather.weatherImage,
                        height: 120,
                        width: 120,
                      ),
                      // Image.asset(
                      //   'assets/sun.png',
                      //   alignment: Alignment.center,
                      //   height: 120,
                      //   width:120,
                      // ),
                      SizedBox(height: 30),
                      Text(
                        '${weather.temperature}°',
                        style: ktextStyle,
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${weather.city}',
                        style: ktextStyle,
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: AppBar(
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.near_me),
                          onPressed: () async {
                            var weatherData =
                                await weathers.getLocationWeather();
                            weather.updateUi(weatherData);
                          })
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                )
              ],
            ),
            drawer: Theme(
              child: NavigatorDrawer(),
              data: Theme.of(context)
                  .copyWith(canvasColor: Colors.blueGrey.withOpacity(0.2)),
            )),
      ),
    );
  }
}