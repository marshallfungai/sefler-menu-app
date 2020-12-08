import 'dart:convert' as convert;
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sefler_menu/models/RestaurantModel.dart';

class MenusService extends ChangeNotifier {


  MenusService();

  void storeLocalMenu({String restaurantDataURL, RestaurantModel restaurantInfo, Box menuBox}) async {

    var name = restaurantInfo.restaurant.name;

    menuBox.put('restaurant_name', name);

    var menus = restaurantInfo.restaurant.menus;
    var menusItems = restaurantInfo.restaurant.menus;

    menuBox.put('restaurant_menus', menus);
    menuBox.put('restaurant_menus_items', menusItems);


  }


  Future<bool> getInfo({String restaurantDataURL, HiveBox }) async {

    try {

     //var _data = await http.get('http://iambriansith.com/demos/shefler-menu/api/restaurant/1');
      var _data = await http.get(restaurantDataURL);
      var jsonResponse;
      if ( _data.statusCode == 200) {
         jsonResponse = convert.jsonDecode( _data.body);
       }

      var _restInfo = RestaurantModel.fromJson(jsonResponse);

      storeLocalMenu(restaurantDataURL : restaurantDataURL, restaurantInfo : _restInfo, menuBox: HiveBox );

      notifyListeners();
      return true;

    } catch (e) {
      print("Could Not Load Data: $e");
      return false;
    }
  }

}