import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  Map data = {};
  HomePage(this.data);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // create map to receive data from loading route
  Map data = {};

  List<String> posters = [
    'assets/images/posters/1.png',
    'assets/images/posters/2.png',
    'assets/images/posters/3.png',
  ];

  @override
  Widget build(BuildContext context) {
    // generating date and day
    DateTime date = DateTime.now();
    String dateformat = DateFormat('dd, MMMM yyyy').format(date);
    String day = DateFormat('EEEE').format(date);

    int now = date.hour;
    // int now = 8;

    bool isDay = now >= 6 && now < 18 ? true : false;

    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    return Container(
      decoration: BoxDecoration(
        color: isDay ? Colors.white : Colors.black87,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(isDay
                    ? 'assets/images/sky.jpg'
                    : 'assets/images/night.png'),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 75),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$day,',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 28,
                            fontFamily: 'Poppins',
                            color: isDay ? Colors.black : Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          '$dateformat',
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              color: isDay ? Colors.black : Colors.white),
                        ),
                      ),
                      Text(
                        now >= 6 && now <= 18
                            ? 'Have a Nice Day'
                            : 'Enjoy Your Rest',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            decoration: TextDecoration.none,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Oswald',
                            color: isDay ? Colors.black : Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text('COVID-19 TODAY',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: isDay ? Colors.black : Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald')),
            Divider(
              height: 10,
              color: isDay ? Colors.black : Colors.white,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['country'] == 'All' ? 'World' : data['country'],
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Poppins',
                          color: isDay ? Colors.black : Colors.white,
                          fontSize: 32),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Image.asset(
                      'assets/images/flag/world.png',
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
                          color:
                              isDay ? Colors.blue[500] : Colors.blueGrey[200],
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
                          color:
                              isDay ? Colors.blue[500] : Colors.blueGrey[200],
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
                          color:
                              isDay ? Colors.blue[500] : Colors.blueGrey[200],
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
                          color:
                              isDay ? Colors.blue[500] : Colors.blueGrey[200],
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
              ],
            ),
            Text('INFORMATION',
                textAlign: TextAlign.center,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: isDay ? Colors.black : Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald')),
            Divider(
              height: 10,
              color: isDay ? Colors.black : Colors.white,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(45, 30, 45, 30),
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    padding: EdgeInsets.only(right: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(posters[index]),
                    ),
                  );
                },
                itemCount: posters.length,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
