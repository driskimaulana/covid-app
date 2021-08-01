import 'package:covid_app/pages/chooseLocationPage.dart';
import 'package:covid_app/pages/home.dart';
import 'package:covid_app/pages/covidPage.dart';
import 'package:covid_app/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routes: {
        '/': (context) => Welcome(),
        '/home': (context) => Home(),
        '/covid': (context) => CovidPage(),
        '/choosePage': (context) => ChooseLocationPage(),
      },
    );
  }
}
