import 'dart:io';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:fluro/fluro.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'router.dart';
import 'landingScreen.dart';
import 'services/SharedPreferenceService.dart';
import 'style.dart';
import 'screens/screens.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final router = FluroRouter();
  Routes.setupRouter(router);
  // if (kIsWeb) {
  //   setUrlStrategy(PathUrlStrategy());
  // }
  runApp(MyApp(router));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final FluroRouter router;
  MyApp(this.router);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {}
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Indigo Bar Menü',
        theme: ThemeData(
          primaryColor: primaryColor,
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: router.generator,
        initialRoute: '/');
  }
}
