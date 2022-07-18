import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../screens/menuCategoryScreen.dart';

import 'constants/globals.dart';
import 'landingScreen.dart';

class Routes {
  // late final FluroRouter FRouter;

  static String LandingScreenRoute = "/";
  static String MenuCatScreenRoute = '/menu/:id';

  static final Handler _LandingScreenhandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    print('handler for landing');
    return LandingScreen();
  });

  static final Handler _MenuCatScreenhandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    print('handler for menu cat');
    String _restaurantDataUrl =
        apiRestaurantMenuRoute + params['id'][0].toString();
    return MenuCategoryScreen(restaurantDataURL: _restaurantDataUrl);
  });

  static void setupRouter(Router) {
    //  Router = router;
    Router.define(
      LandingScreenRoute,
      handler: _LandingScreenhandler,
    );
    Router.define(
      MenuCatScreenRoute,
      handler: _MenuCatScreenhandler,
    );
  }
}

//
// Route<dynamic> generateRoute(RouteSettings settings) {
//   const String LandingScreenRoute = '/';
//   const String MenuCatScreenRoute = '/menu';
//
//   switch (settings.name) {
//     case LandingScreenRoute:
//       return MaterialPageRoute(builder: (context) => LandingScreen());
//     case MenuCatScreenRoute:
//       String _restaurantDataUrl = apiRestaurantMenuRoute + '/8';
//       print(settings.arguments);
//       return MaterialPageRoute(
//           builder: (context) =>
//               MenuCategoryScreen(restaurantDataURL: _restaurantDataUrl));
//       return MaterialPageRoute(builder: (context) => LandingScreen());
//     default:
//       return MaterialPageRoute(builder: (context) => LandingScreen());
//   }
// }
