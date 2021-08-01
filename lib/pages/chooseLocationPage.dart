import 'package:covid_app/services/api_details.dart';
import 'package:flutter/material.dart';

class ChooseLocationPage extends StatefulWidget {
  const ChooseLocationPage({Key? key}) : super(key: key);

  @override
  _ChooseLocationPageState createState() => _ChooseLocationPageState();
}

class _ChooseLocationPageState extends State<ChooseLocationPage> {
  List<APIServices> apiService = [
    APIServices(
        endpoint: 'australia',
        imageAsset: 'images/bg/sydney.jpg',
        flag: 'images/flag/australia.png'),
    APIServices(
        endpoint: 'egypt',
        imageAsset: 'images/bg/kairo.jpg',
        flag: 'images/flag/egypt.png'),
    APIServices(
        endpoint: 'france',
        imageAsset: 'images/bg/paris.jpg',
        flag: 'images/flag/france.png'),
    APIServices(
        endpoint: 'india',
        imageAsset: 'images/bg/india.jpg',
        flag: 'images/flag/india.png'),
    APIServices(
        endpoint: 'indonesia',
        imageAsset: 'images/bg/boro.jpg',
        flag: 'images/flag/indonesia.jpg'),
    APIServices(
        endpoint: 'japan',
        imageAsset: 'images/bg/tokyo.jpg',
        flag: 'images/flag/japan.png'),
    APIServices(
        endpoint: 'malaysia',
        imageAsset: 'images/bg/kuala.jpg',
        flag: 'images/flag/malay.png'),
    APIServices(
        endpoint: 'singapore',
        imageAsset: 'images/bg/singapore.jpg',
        flag: 'images/flag/singapore.png'),
    APIServices(
        endpoint: 'switzerland',
        imageAsset: 'images/bg/swiss.jpg',
        flag: 'images/flag/swiss.png'),
    APIServices(
        endpoint: 'thailand',
        imageAsset: 'images/bg/bangkok.jpg',
        flag: 'images/flag/thailand.jpg'),
    APIServices(
        endpoint: 'uk',
        imageAsset: 'images/bg/uk.jpg',
        flag: 'images/flag/uk.png'),
  ];

  void updateData(index) async {
    APIServices instance = apiService[index];

    await instance.getData();

    Navigator.pop(context, {
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Text('Choose Location',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Oswald',
              ),
              textAlign: TextAlign.center),
        ),
        SizedBox(
          height: 30,
        ),
        Divider(
          color: Colors.white,
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: apiService.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 4.0, vertical: 1.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        updateData(index);
                      },
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/${apiService[index].flag}'),
                      ),
                      title: Text(
                        apiService[index].endpoint.toUpperCase(),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
