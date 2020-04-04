import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  // backgroundColor: Colors.red,
                  backgroundImage: AssetImage('images/profile_pic.jpg'),
                ),
                Text(
                  'Jurytan Nguyen',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'SOFTWARE ENGINEER',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '(669) 342-8101',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'jnguyen7410@gmail.com',
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontFamily: 'Source Sans Pro',
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
