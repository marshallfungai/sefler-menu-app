//Get the menu for chosen restaurant using scanned URL
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> fn_httpRestaurant(restaurantDataURL, catId) async {
  String menuItemsUrl = restaurantDataURL + '&category=' + catId.toString();
  var response = await http.get(Uri.parse(menuItemsUrl));
  print('-----------menu items url');
  print(menuItemsUrl);
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);

    if (kDebugMode) {
      // print('httpRest');
      // print(response.statusCode);
      //print(response.body);
      //print(jsonResponse[1]);
    }

    return jsonResponse;
  } else {
    if (kDebugMode) {
      print('----Lost it-----');
      print(response.statusCode);
      print(response.body);
    }
  }

  return [];
}
