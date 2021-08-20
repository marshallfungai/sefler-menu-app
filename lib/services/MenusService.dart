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
    var desc_en= restaurantInfo.restaurant.descriptionEn;
    var desc_tr= restaurantInfo.restaurant.descriptionTr;
    var image= restaurantInfo.restaurant.image;
    var open_time = restaurantInfo.restaurant.availabilityStarts;
    var close_time = restaurantInfo.restaurant.availabilityEnds;
    var address = restaurantInfo.restaurant.contact.addressLine1;

    menuBox.put('restaurant_name', name);
    menuBox.put('restaurant_desc_en', desc_en);
    menuBox.put('restaurant_desc_tr', desc_tr);
    menuBox.put('opendays', desc_tr);
    menuBox.put('res_img', image);

    menuBox.put('address', address);
    menuBox.put('open_time', close_time);
    menuBox.put('close_time', open_time);

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

     if ( _data.statusCode == 200) {
       return true;
     }
     else {
       return false;
     }


    } catch (e) {
      print("Could Not Load Data: $e");
      return false;
    }
  }

}