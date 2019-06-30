import 'package:flutter/material.dart';
import 'package:demo1/home_page.dart';
import 'doctor_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "iMed",
      home: MyHomePage(),

      routes: <String, WidgetBuilder>{
        '/homepage' : (BuildContext context) => MyHomePage(),
        '/doctor_page' : (BuildContext context) =>  DoctorPage(),
      }
    );
  }
}
