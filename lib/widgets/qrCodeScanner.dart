import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sefler_menu/screens/screens.dart';
import 'package:sefler_menu/services/FetchMenusService.dart';

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  var result ;

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        _menuFetch.
        print('scammed item ${result.rawContent}');

      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
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
        result = "You pressed the back button before scanning anything";
        print(result);
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
        print(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    String restaurantID;

    final _menuFetch = Provider.of<FetchMenusService>(context, listen: true);

    return SizedBox(
      width: windowWidth * .30,
      height:  windowWidth * .30,
      child: FloatingActionButton(
        onPressed:  () async {
          restaurantID =  await _scanQR();

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
