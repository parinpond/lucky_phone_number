import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.blue.shade900;
  Color primaryColor = Colors.green.shade900;
  Widget showProgress(){
    return Center(child: CircularProgressIndicator(),);
  }
  Container showLogo() {
    return Container(
      width: 120.0, 
      child: Image.asset('images/logo.png'),
    );
  }
  SizedBox mySizebox() => SizedBox(
    width: 8.0,
    height: 16.0,
  );
  Text showTitle(String title) => Text(
    title,
    style: TextStyle(
      fontSize: 24.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
  Text showTitleH2(String title) => Text(
    title,
    style: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}
