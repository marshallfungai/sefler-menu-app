import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/MenusService.dart';
import '../style.dart';
import '../widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MenusService _menus = new MenusService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MenusService>.value(value: _menus),
      ],
      child: Consumer<MenusService>(builder: (context, model, child) {
        if (kIsWeb) {
          print('--------this is the web version : home screen');
        }
        return _homeScanner(context);
      }),
    );
  }

  Widget _homeScanner(context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: AssetImage('assets/images/sefler-menu-home-bg.jpg'),
                    fit: BoxFit.cover)),
          ),
          Container(
            color: primaryColor.withOpacity(0.85),
            child: Center(
              child: QrCodeScanner(
                scaffold: _scaffoldKey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
