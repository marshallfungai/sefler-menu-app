import 'dart:convert';
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sefler_menu/models/SectionModel.dart';

class MenusService extends ChangeNotifier {



  final apiBaseUrl  = 'https://api.mockaroo.com/api/';

  MenusService();

  void storeLocalMenu(id_restaurant, menuInfo) {

    //Check if it exists locally
    // var restInfo = box.get(id_restaurant);
  }

  Future<bool> getInfo(String id_restaurant) async {
    try {

      final fetchMenuURL  = apiBaseUrl + id_restaurant;
      var _data = await http.post(fetchMenuURL);
      print('Fetch url ************ $fetchMenuURL');
      var _menuInfo = CategoryModel.fromJson(json.decode(_data.body));
      print('data url ************ $_menuInfo');
      storeLocalMenu(id_restaurant, _menuInfo);

      notifyListeners();
      return true;

    } catch (e) {
      print("Could Not Load Data: $e");
      return false;
    }
  }

}