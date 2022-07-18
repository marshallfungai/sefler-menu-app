import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../screens/screens.dart';

class QrCodeScanner extends StatefulWidget {
  final scaffold;
  QrCodeScanner({this.scaffold});

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  var restaurantDataURL;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: windowWidth * .40,
      height: windowWidth * .40,
      child: FloatingActionButton(
        onPressed: () async {
          var scanResult = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SimpleBarcodeScannerPage(),
              ));

          bool _validURL = Uri.parse(scanResult).isAbsolute;

          if (_validURL == true) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MenuCategoryScreen(
                        restaurantDataURL: restaurantDataURL)));
          } else {
            final snackbar = SnackBar(
              backgroundColor: Colors.pinkAccent,
              duration: Duration(seconds: 5),
              content: Row(
                children: const <Widget>[
                  CircleAvatar(
                    maxRadius: 20,
                    backgroundImage:
                        AssetImage("assets/images/sefler-menu-logo.png"),
                  ),
                  Spacer(),
                  Text('Invalid')
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
            const SizedBox(
              height: 10,
            ),
            Text('Tarama Menüsü')
          ],
        ),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
