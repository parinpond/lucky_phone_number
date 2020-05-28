import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lucky_phone_number/model/result_model.dart';
import 'package:lucky_phone_number/screens/result.dart';
import 'package:lucky_phone_number/utility/my_style.dart';
import 'package:lucky_phone_number/utility/normal_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field
  String phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เบอร์มงคล'),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().mySizebox(),
                MyStyle().showTitle('เบอร์มงคล'),
                MyStyle().mySizebox(),
                phoneForm(),
                 MyStyle().mySizebox(),
                checkButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneForm() => Container(
    width: 300.0,
    child: TextField(
      keyboardType: TextInputType.phone,
      maxLength: 10,
      onChanged: (value) => phone = value.trim(),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.phone,
          color: MyStyle().darkColor,
        ),
        labelStyle: TextStyle(color: MyStyle().darkColor),
        labelText: 'เบอร์โทร :',
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().darkColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().primaryColor)),
      ),
    ),
  );
  Widget checkButton() => Container(
    width: 300.0,
    child: RaisedButton(
      color: MyStyle().darkColor,
      onPressed: () {
        if (phone == null || phone.isEmpty ) {
          normalDialog(context, 'มีช่องว่าง กรุณากรอกให้ครบ ค่ะ');
        }else if(phone.length != 10){
          normalDialog(context, 'มีช่องว่าง กรุณากรอกให้ครบ ค่ะ');
        } else {
          checkPhone();
          
        }
      },
      child: Text(
        'ตรวจสอบ',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
  Future<Null> checkPhone()async{
    MyStyle().showProgress();
    String url = 'http://parinyimz.com/lucky_phone_number/check.php?isAdd=true&Phone=$phone';
    try {
          Response response = await Dio().get(url);
          var result = json.decode(response.data);
          for (var map in result) {
            ResultModel resultModel = ResultModel.fromJson(map);
            routeToService(Result(), resultModel);
          }
        } catch (e) {
        }
  }
  Future<Null> routeToService(Widget myWidget, ResultModel resultModel) async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('id', resultModel.id);
        preferences.setString('Total', resultModel.total);
        preferences.setString('Name', resultModel.name);
        preferences.setString('Detail', resultModel.detail);
        MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget,);
        Navigator.pushAndRemoveUntil(context, route, (route) => false);
      }
 

}
