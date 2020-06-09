import 'package:flutter/material.dart';
import 'package:geo_app/screen/city_screen.dart';
import 'package:geo_app/widget/create_draw.dart';
import 'package:geo_app/widget/create_drewerbody.dart';


class NavigatorDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawHeader(),
          createDrawBodyItem(icon: Icons.search,
          text:'search',
          onTap: ()=>
           Navigator.push(context, MaterialPageRoute(
             builder: (context) =>
             CityScreen())),
          )],
      ),
    );
  }
}
