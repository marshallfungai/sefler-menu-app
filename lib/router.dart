import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../screens/menuCategoryScreen.dart';

import 'constants/globals.dart';
import 'landingScreen.dart';

class Routes {
  // late final FluroRouter FRouter;

  static String LandingScreenRoute = "/";
  static String MenuCatScreenRoute = '/menu/:id';

  // static final Handler _LandingScreenhandler =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return LandingScreen();
  // });

  static final Handler _LandingScreenhandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    String _restaurantDataUrl = apiRestaurantMenuRoute + '/1';
    return MenuCategoryScreen(restaurantDataURL: _restaurantDataUrl);
  });

  static final Handler _MenuCatScreenhandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    String _restaurantDataUrl =
        apiRestaurantMenuRoute + '/' + params['id'][0].toString();
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
