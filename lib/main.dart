import 'package:flutter/material.dart';
import 'package:lucky_phone_number/screens/home.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch:Colors.deepOrange),
      title: "เบอร์มงคล",
      home: Home(),
    );
  }
}