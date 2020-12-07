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
import 'services/MenusService.dart';
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
      title: 'Şefler Menü',
      theme: ThemeData(
        primaryColor: primaryColor,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Şefler Menü'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  MenusService _menus = new MenusService();


  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers:  [
        ChangeNotifierProvider<MenusService>.value(value: _menus),
      ],
      child:  Consumer<MenusService>(builder: (context, model, child) {

        return _homeScanner(context);
      }),

    );


  }

  Widget _homeScanner(context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage('assets/images/sefler-menu-home-bg.jpg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            color: primaryColor.withOpacity(0.85),
            child: Center(
              child: LandingScreen(),
            ),
          )

        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
