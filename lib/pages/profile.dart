import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = ((MediaQuery.of(context).size.height / 2) - 220);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: height),
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/me.jpg'),
                        radius: 50,
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'D\'Riski Maulana',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Android Developer',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Hi, my name is D\'Riski Maulana a student, programmer, cat lover, and dreamer. I like write a code, its just make me feel calm and safe. Knock me on Instagram @driskimaulana, hope we can be a friend.',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'maulanadriski@gmail.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
