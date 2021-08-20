import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sefler_menu/models/RestaurantModel.dart';
import 'models/ContactModel.dart';
import 'models/MenuItemsModel.dart';
import 'models/MenusModel.dart';
import 'models/OpenDaysModel.dart';
import 'services/SharedPreferenceService.dart';
import 'style.dart';
import 'screens/screens.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);

  Hive.registerAdapter(RestaurantModelAdapter());
  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(ItemsAdapter());
  Hive.registerAdapter(MenusCatAdapter());
  Hive.registerAdapter(OpenDaysAdapter());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Şefler Menü',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RedirectToInit(),
    );
  }
}
 class RedirectToInit extends StatefulWidget {
   @override
   _RedirectToInitState createState() => _RedirectToInitState();
 }

 class _RedirectToInitState extends State<RedirectToInit> {

   var _checkIsFirstSeen ;

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

          if(snapshot.hasData && snapshot.data == true) {
             return  MyHomePage();
           }

           return OnBoardingScreen();

         }
     );

   }
 }

