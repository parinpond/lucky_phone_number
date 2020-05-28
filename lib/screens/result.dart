import 'package:flutter/material.dart';
import 'package:lucky_phone_number/utility/my_style.dart';
import 'package:lucky_phone_number/utility/signout_process.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Result extends StatefulWidget {
  Result({Key key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String nameResult, totalResult, detailResult;

  @override
  void initState() {
    super.initState();
    findResult();
  }

  Future<Null> findResult() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nameResult = preferences.getString('Name');
      totalResult = preferences.getString('Total');
      detailResult = preferences.getString('Detail');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('คำทำนาย'),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().mySizebox(),
                MyStyle().showTitle(nameResult),
                MyStyle().mySizebox(),
                MyStyle().showTitle(totalResult),
                MyStyle().mySizebox(),
                MyStyle().showTitleH2(detailResult),
                MyStyle().mySizebox(),
                resetButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget resetButton() => Container(
    width: 300.0,
    child: RaisedButton(
      color: MyStyle().darkColor,
      onPressed: () => signOutProcess(context),
      child: Text(
        'ทำนายใหม่',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
  
}
