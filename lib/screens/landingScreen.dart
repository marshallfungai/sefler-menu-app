import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/widgets.dart';
import 'menuCategoryScreen.dart';


class ActionSections extends StatefulWidget {

  final scaffoldKey;
  ActionSections({this.scaffoldKey});

  @override
  _ActionSections createState() => _ActionSections();
}

class _ActionSections extends State<ActionSections> {


  final Uri _nethouseLaunchUri = Uri(
      scheme: 'https',
      path: 'nethouse.net'
  );

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
          child: QrCodeScanner(scaffold: widget.scaffoldKey,),
        ),

      ],
    );
  }
}
