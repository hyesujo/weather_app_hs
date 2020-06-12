import 'package:flutter/material.dart';
import 'package:geo_app/const.dart';
import 'package:geo_app/model/wether.dart';
import 'package:geo_app/view/navigator_dawer.dart';

class LocationScreen extends StatefulWidget {
  static const routeName = '/lacation';

  final locationWeather;

  const LocationScreen({Key key, this.locationWeather}) : super(key: key);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weathers = WeatherModel();

  int temperature;
  dynamic weatherImage;
  String city;
  dynamic weatherBack;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {
    double temp = weatherData['main']['temp'].toDouble();
     temperature = temp.toInt();
     var condition = weatherData['weather'][0]['id'];
    weatherBack = weathers.getWBackgroundImage(condition);
    weatherImage = weathers.getWeatherImage(condition);
    city = weatherData['name'];
     });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            image: DecorationImage(
                image: AssetImage(weatherBack),
                colorFilter:  ColorFilter.mode(
                    Colors.black.withOpacity(0.5), BlendMode.dstATop),
                fit: BoxFit.cover),
          ),
          constraints: BoxConstraints.expand(),
          padding: EdgeInsets.only(top : 200),
          child: Column(children: <Widget>[
            Image.asset(weatherImage,
               height: 120,
              width:120,
            ),
            // Image.asset(
            //   'assets/sun.png',
            //   alignment: Alignment.center,
            //   height: 120,
            //   width:120,
            // ),  
            SizedBox(height:30),
            Text('$temperature°',
            style: ktextStyle,
            ),
            SizedBox(
              height:10
            ),
            Text('$city',
            style: ktextStyle,)
          ],
          ),
        ),
        Positioned(
          child:AppBar(
           actions: <Widget>[
             IconButton(icon: Icon(Icons.near_me),
              onPressed: () async {
                var weatherData = await weathers.getLocationWeather();
                updateUi(weatherData);
              })
           ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),)
      ],
      ),
      drawer: Theme(child: NavigatorDrawer(),
        data: Theme.of(context).
        copyWith(canvasColor: Colors.blueGrey.withOpacity(0.2)),
      )
    );
  }
}
