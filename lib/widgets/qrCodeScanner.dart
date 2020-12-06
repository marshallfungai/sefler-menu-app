import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sefler_menu/screens/screens.dart';
import 'package:sefler_menu/services/MenusService.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {


  var result ;
  var resultType, restaurantID ;
  bool resultStatus = false;

  // print(result.type); // The result type (barcode, cancelled, failed)
  // print(result.rawContent); // The barcode content
  // print(result.format); // The barcode format (as enum)
  // print(result.formatNote); // If a unknown format was scanned this field contains a note

  @override
  initState() {

    result = null;
    resultType = null;
    resultStatus = false;
    restaurantID = null;

    super.initState();
    // Add listeners to this class
  }

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        resultType = result.type;
        resultStatus = true;
        restaurantID = result.rawContent;
        //print('scammed item ${result.type}');
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuCategoryScreen( restaurantID: restaurantID)));

      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          resultType = result.type;
          result = "Camera permission was denied";
          print(result);
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          print(result);
        });
      }
    } on FormatException {
      setState(() {
        resultType = result.type;
        result = "You pressed the back button before scanning anything";
        print(result);
      });
    } catch (ex) {
      setState(() {
        resultType = result.type;
        result = "Unknown Error $ex";
        print(result);
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;


    final _menuFetch = Provider.of<MenusService>(context, listen: true);



    return SizedBox(
      width: windowWidth * .30,
      height:  windowWidth * .30,
      child: FloatingActionButton(
        onPressed:  (){
           _scanQR();
           print('Restaurant id $restaurantID');
           // _menuFetch.getInfo(restaurantID );

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/icons/qr-code.png'),
            SizedBox(height: 10,),
            Text('Scan Menu')
          ],
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }

}
