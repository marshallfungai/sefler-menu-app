import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sefler_menu/screens/screens.dart';
import 'package:sefler_menu/services/MenusService.dart';

class QrCodeScanner extends StatefulWidget {

  final scaffold;
  QrCodeScanner({this.scaffold});

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {


  var result, resultContent ;
  var resultType,  restaurantDataURL ;
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
    restaurantDataURL = null;

    super.initState();
    // Add listeners to this class
    resultStatus = false;
  }

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {

        resultType = qrResult.type;
        result = 'Tarama iptal edildi...';

        if(resultType.toString() == 'Barcode')  {

          // restaurantDataURL = qrResult.rawContent;
           String DataURL = qrResult.rawContent;
           String findDomain = 'http://localhost';
           String addApi = 'https://iambriansith.com/demo/shefler-menu';
           resultStatus = true;

           print('------------------------------- type ------------------------------------');
           print(qrResult.type);
           print(DataURL);
           // RegExp exp = RegExp(r"(\w+)");
           // print(exp);
           restaurantDataURL = addApi + DataURL.substring(findDomain.length);
           print(restaurantDataURL);
        }
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {

          resultStatus =false;
          result = "Kamera izni reddedildi";
          //print(result);

        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          resultStatus =false;
          //print(result);
        });
      }
    } on FormatException {
      setState(() {

        resultStatus =false;
        result = "Herhangi bir şey taramadan önce geri düğmesine bastınız";
        print(result);


      });
    } catch (ex) {
      setState(() {

        resultStatus =false;
        result = "Unknown Error $ex";
        print(result);

      });
    }

  }

  @override
  Widget build(BuildContext context) {

    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return SizedBox(

      width: windowWidth * .40,
      height:  windowWidth * .40,

      child: FloatingActionButton(
        onPressed:  () async{
            await _scanQR();
            if(resultStatus == true) {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MenuCategoryScreen(  restaurantDataURL:  restaurantDataURL)));
            }
            else {

              final snackbar = SnackBar(
                backgroundColor: Colors.pinkAccent,
                duration: Duration(seconds: 5),
                content: Row(
                  children: <Widget>[
                  CircleAvatar(
                      maxRadius: 20,
                      backgroundImage: AssetImage("assets/images/sefler-menu-logo.png"),
                    ),
                    Spacer(),
                    Text(result)
                  ],
                ),
              );

              widget.scaffold.currentState.showSnackBar(snackbar);
            }

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
