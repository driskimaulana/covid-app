import 'package:covid_app/pages/covidPage.dart';
import 'package:covid_app/pages/main_page.dart';
import 'package:covid_app/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // create map to receive data from loading route
  static Map data = {};

  List<String> posters = [
    'assets/images/posters/1.png',
    'assets/images/posters/2.png',
    'assets/images/posters/3.png',
  ];

  // variabel for holding the active tab
  int _currentIndex = 0;
  List<Widget> appbarMenu = [HomePage(data), CovidPage(), Profile()];

  @override
  Widget build(BuildContext context) {
    // generating date and day
    DateTime date = DateTime.now();
    String dateformat = DateFormat('dd, MMMM yyyy').format(date);
    String day = DateFormat('EEEE').format(date);

    int now = date.hour;
    // int now = 20;

    bool isDay = now >= 6 && now < 18 ? true : false;

    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      backgroundColor: isDay ? Colors.white : Colors.black87,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: isDay ? Colors.white : Colors.grey[900],
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_hospital,
              ),
              title: Text('Covid-19')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              title: Text('About')),
        ],
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.grey[600],
      ),
      body: appbarMenu[_currentIndex],
    );
  }
}
