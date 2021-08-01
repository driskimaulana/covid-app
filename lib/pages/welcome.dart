import 'package:covid_app/services/api_details.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void setupData() async {
    APIServices instance = APIServices(
        endpoint: 'all',
        imageAsset: 'images/bg/indo.jpg',
        flag: 'images/flag/world.png');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'country': instance.country,
      'active': instance.active,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'newCase': instance.newCase,
      'newDeath': instance.newDeath,
      'total': instance.total,
      'endpoint': instance.endpoint,
      'imageAsset': instance.imageAsset,
      'flag': instance.flag,
    });
  }

  @override
  void initState() {
    super.initState();
    setupData();
  }

  @override
  Widget build(BuildContext context) {
    double height = ((MediaQuery.of(context).size.height / 2) - 50);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: height),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 50,
                width: 80,
              ),
              Text(
                'D\'R Industries',
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              )
            ],
          ),
        ),
      ),
    );
  }
}
