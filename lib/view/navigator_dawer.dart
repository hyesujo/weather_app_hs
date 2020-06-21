import 'package:flutter/material.dart';
import 'package:geo_app/Provider/update_wearher.dart';
import 'package:geo_app/model/wether.dart';
import 'package:geo_app/screen/city_screen.dart';
import 'package:geo_app/widget/create_draw.dart';
import 'package:geo_app/widget/create_drewerbody.dart';
import 'package:provider/provider.dart';


class NavigatorDrawer extends StatelessWidget {
 
 final WeatherModel weathers = WeatherModel();
 
  @override
  Widget build(BuildContext context) {

    return 
    Consumer<UpdateWeather>(builder: (context,weather,_)=>
      Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            createDrawHeader(),
            createDrawBodyItem(icon: Icons.search,
            text:'search',
            onTap: () async {
            var citysName = await Navigator.push(
              context, MaterialPageRoute(
              builder: (context) { 
                return CityScreen();
              },
               ),
               ); 
               if (citysName != null) {
                var weatherData =await weathers.getCityWeather(citysName);
                weather.updateUi(weatherData);
               }
            },
            ),
            ],
        ),
    ));
  }
}
