import 'package:flutter/cupertino.dart';
import 'screens/homeScreen.dart';
import 'screens/onBoardingScreen.dart';
import 'services/SharedPreferenceService.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var _checkIsFirstSeen;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkIsFirstSeen = SharedPreferencesStorage.checkSharedPreference("seen");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _checkIsFirstSeen,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return MyHomePage(
              title: '',
            );
          }
          return OnBoardingScreen();
        });
  }
}
