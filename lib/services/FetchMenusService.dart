import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sefler_menu/models/SectionModel.dart';

class FetchMenusService extends ChangeNotifier {

  final apiBaseUrl  = 'https://api.mockaroo.com/api/';

  Future<CategoryModel> getInfo(String id_restaurant) async {
    try {

      final fetchMenuURL  = apiBaseUrl + id_restaurant;
      var _data = await http.post(fetchMenuURL);

      var _menuCategories = CategoryModel.fromJson(json.decode(_data.body));
      return _menuCategories;

    } catch (e) {
      print("Could Not Load Data: $e");
      return null;
    }
  }

}