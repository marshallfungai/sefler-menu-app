// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../widgets/widgets.dart';
// import 'menuCategoryScreen.dart';
//
// class ActionSections extends StatefulWidget {
//   final scaffoldKey;
//   ActionSections({this.scaffoldKey});
//
//   @override
//   _ActionSections createState() => _ActionSections();
// }
//
// class _ActionSections extends State<ActionSections> {
//   @override
//   Widget build(BuildContext context) {
//     double windowHeight = MediaQuery.of(context).size.height;
//     double windowWidth = MediaQuery.of(context).size.width;
//
//     return Stack(
//       children: [
//         Positioned(
//           left: 0,
//           right: 0,
//           top: windowHeight * .40,
//           child: QrCodeScanner(
//             scaffold: widget.scaffoldKey,
//           ),
//         ),
//       ],
//     );
//   }
// }

//-----------------------

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
// import '../models/RestaurantModel.dart';
// import '../services/MenusService.dart';
// import 'screens.dart';
// import '../style.dart';
// import '../widgets/widgets.dart';
//
// class MyHomePage extends StatefulWidget {
// const MyHomePage({required this.title});
//
// final String title;
//
// @override
// _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
// final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
// MenusService _menus = new MenusService();
//
// @override
// Widget build(BuildContext context) {
// return MultiProvider(
// providers: [
// ChangeNotifierProvider<MenusService>.value(value: _menus),
// ],
// child: Consumer<MenusService>(builder: (context, model, child) {
// return _homeScanner(context);
// }),
// );
// }
//
// Widget _homeScanner(context) {
// return Scaffold(
// key: _scaffoldKey,
// body: Stack(
// children: [
// Container(
// decoration: BoxDecoration(
// color: Colors.red,
// image: DecorationImage(
// image: AssetImage('assets/images/sefler-menu-home-bg.jpg'),
// fit: BoxFit.cover)),
// ),
// Container(
// color: primaryColor.withOpacity(0.85),
// child: Center(
// child: QrCodeScanner(
// scaffold: _scaffoldKey,
// ),
// ),
// )
// ],
// ),
// );
// }
// }
