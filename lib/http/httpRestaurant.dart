//Get the menu for chosen restaurant using scanned URL
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> fn_httpRestaurant(restaurantDataURL, Box menuBox) async {
  var response = await http.get(Uri.parse(restaurantDataURL));
  if (kDebugMode) {
    print('------------------restaurant debug-----------------');
    print(restaurantDataURL);
  }

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);

    if (kDebugMode) {
      print(jsonResponse['restaurant']);
      print(jsonResponse['restaurant']);
      print(jsonResponse['restaurant']['name']);
      print(jsonResponse['restaurant']['description_en']);
      print(jsonResponse['restaurant']['menus'][0]['restaurant_id']);
      print(jsonResponse['restaurant']['image']);
    }

    var name = jsonResponse['restaurant']['name'].toString();
    var desc_en = jsonResponse['restaurant']['description_en'].toString();
    var desc_tr = jsonResponse['restaurant']['description_tr'].toString();
    var image = jsonResponse['restaurant']['image'].toString();
    var open_time =
        jsonResponse['restaurant']['availability_starts'].toString();
    var close_time = jsonResponse['restaurant']['availability_ends'].toString();
    var address =
        jsonResponse['restaurant']['contact']['address_line_1'].toString();

    menuBox.put('restaurant_name', name);
    menuBox.put('restaurant_desc_en', desc_en);
    menuBox.put('restaurant_desc_tr', desc_tr);
    menuBox.put('opendays', open_time);
    menuBox.put('res_img', image);
    menuBox.put('address', address);
    menuBox.put('open_time', close_time);
    menuBox.put('close_time', open_time);
    var menus = jsonResponse['restaurant']['menus'];
    var menusItems = jsonResponse['restaurant']['menus'];
    menuBox.put('restaurant_menus', menus);
    menuBox.put('restaurant_menus_items', menusItems);

    return true;
  }

  return false;
}
