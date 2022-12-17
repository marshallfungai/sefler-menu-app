//Get the menu for chosen restaurant using scanned URL
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List> fn_httpRestaurantCategories(restaurantDataURL, Box menuBox,
    {int parent = 0}) async {
  String parent_id = parent.toString() ?? '0';

  var response = await http.get(Uri.parse(restaurantDataURL));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (kDebugMode) {
      print('-----------category url' + parent_id.toString());
      print(restaurantDataURL + '&parent=' + parent_id);
      // print('wewe');
      // print(response.statusCode);
      // print(response.body);
      // print(jsonResponse);
    }
    return jsonResponse;
  }

  return [];
}
