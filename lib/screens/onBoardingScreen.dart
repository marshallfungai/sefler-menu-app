import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sefler_menu/screens/screens.dart';
import 'package:sefler_menu/services/SharedPreferenceService.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //SharedPreferencesStorage.setSharedPreference('bool', "seen", true);

  }


  @override
  Widget build(BuildContext context) {

    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body:  Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image:  AssetImage("assets/images/sefler-menu-home-bg.jpg"),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(.5), BlendMode.srcOver),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 32
                  ),
                  margin: EdgeInsets.only(
                      top: windowHeight * .15
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(

                          child: CircleAvatar(
                            maxRadius: windowWidth * .15,
                            backgroundImage: AssetImage("assets/images/sefler-menu-logo.png"),
                          ),

                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Paperless menu at your favourite restaurant, bar or chill-spot. Created with your health in mind.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 16
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Text(
                            'Scan the qr code in your restaurant, kebab shop, bar or coffee shop... That\'s all!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [

                            SizedBox(height: windowHeight * .01,),
                            Text(
                              'For The Community.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 52, vertical: 25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        child: Text(
                          'Get Started',
                          style: TextStyle( fontSize: 15),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Şefler Menü')));
                          });
                        }
                    ),
                  )
              ],
            )
        )
    );
  }
}
