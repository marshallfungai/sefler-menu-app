import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'style.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Şefler Menü',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Şefler Menü'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                  image: AssetImage('assets/images/sefler-menu-home-bg.jpg'),
                  fit: BoxFit.cover
                )
            ),
          ),
          Container(
            color: primaryColor.withOpacity(0.85),
            child: Center(
              child: LandingScreen(),
            ),
          )

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
