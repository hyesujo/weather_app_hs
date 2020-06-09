

import 'package:flutter/material.dart';

class CityScreen extends StatelessWidget {
  static const String routeName ='/cityScreen';

  @override
  Widget build(BuildContext context) {
  final _mycontroller = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/city.jpg'),
            fit: BoxFit.cover,
            )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
                  child: Column(
            children: <Widget>[
            Align(alignment: Alignment.topLeft,
            child: FlatButton(onPressed: (){
              Navigator.pop(context);
            }, child: Icon(Icons.arrow_back_ios,
            size:30),
            ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: TextField(
                decoration: InputDecoration(
                  icon:Icon(Icons.search),
                  filled: true,
                  hintText: 'Enter City Name'
                ),
                controller: _mycontroller,
                autofocus: true,
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}