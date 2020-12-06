import 'package:flutter/material.dart';
import 'package:sefler_menu/screens/screens.dart';
import '../widgets/widgets.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

   @override
  Widget build(BuildContext context) {

   double windowHeight = MediaQuery.of(context).size.height;
   double windowWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top : windowHeight * .40,
          child: QrCodeScanner(),
        ),
        Positioned(
         left: 0,
         right: 0,
         bottom : windowHeight * .10,
         child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal:  100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all( Radius.circular(10) ),
          ),
          child: Center(child: GestureDetector(
              onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuCategoryScreen()));},
              child: Text('Powered by : Nethouse'))),
        ))
      ],
    );
  }
}
