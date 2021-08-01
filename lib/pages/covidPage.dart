import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  // create map to receive data from loading route
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    double height = ((MediaQuery.of(context).size.height / 2) - 250);

    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/${data['imageAsset']}'),
                  fit: BoxFit.cover),
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(top: height),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data['country'] == 'All' ? 'World' : data['country'],
                          style: TextStyle(color: Colors.white, fontSize: 32),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Image.asset(
                          'assets/${data['flag']}',
                          width: 24,
                          height: 24,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'ACTIVE CASE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                    NumberFormat.decimalPattern()
                                        .format(data['active']),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.black,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_upward,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    Text(
                                      NumberFormat.decimalPattern()
                                          .format(data['newCase']),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Colors.red,
                                          decoration: TextDecoration.none,
                                          fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: <Widget>[
                                Text('DEATHS CASE',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                    NumberFormat.decimalPattern()
                                        .format(data['deaths']),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.black,
                                    )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_upward,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    Text(
                                        NumberFormat.decimalPattern()
                                            .format(data['newDeath']),
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          decoration: TextDecoration.none,
                                          fontSize: 14,
                                          color: Colors.red,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: <Widget>[
                                Text('RECOVERED',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                    NumberFormat.decimalPattern()
                                        .format(data['recovered']),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Column(
                              children: <Widget>[
                                Text('TOTAL CASE',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                    NumberFormat.decimalPattern()
                                        .format(data['total']),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      decoration: TextDecoration.none,
                                      fontSize: 16,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.blue[500],
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton.icon(
                          onPressed: () async {
                            dynamic result = await Navigator.pushNamed(
                                context, '/choosePage');

                            setState(() {
                              data = {
                                'country': result['country'],
                                'active': result['active'],
                                'deaths': result['deaths'],
                                'recovered': result['recovered'],
                                'newCase': result['newCase'],
                                'newDeath': result['newDeath'],
                                'total': result['total'],
                                'endpoint': result['endpoint'],
                                'imageAsset': result['imageAsset'],
                                'flag': result['flag'],
                              };
                            });
                          },
                          icon: Icon(Icons.location_pin, color: Colors.white),
                          label: Text(
                            'Choose Location',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
