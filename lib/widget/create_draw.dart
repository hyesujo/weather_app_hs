import 'package:flutter/material.dart';

Widget createDrawHeader() {
  return DrawerHeader(
    margin:EdgeInsets.zero,
    padding: EdgeInsets.zero,
    decoration: BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5
      ), BlendMode.dstATop),
        fit: BoxFit.fill,
        image: AssetImage('assets/23284.jpg'),
        ),
    ),
    child: Stack(children: <Widget>[
      Positioned(
        top: 60,
        left:70,
        child: Text('Today\'s Weather',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color:Colors.white),
        ),
        ),
    ],
    ),
    );
}