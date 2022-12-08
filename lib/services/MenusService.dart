import 'package:flutter/material.dart';
import '../http/httpRestaurant.dart';
import '../http/httpRestaurantCategories.dart';

class MenusService extends ChangeNotifier {
  MenusService();
  List categories = [];
  List products = [];

  Future getCatMenuItems({required String restaurantDataURL, catId}) async {
    print(restaurantDataURL);
    products = await fn_httpRestaurant(restaurantDataURL, catId);
    notifyListeners();
    return products;
  }

  Future getCatList({required String restaurantDataURL, HiveBox}) async {
    List categories =
        await fn_httpRestaurantCategories(restaurantDataURL, HiveBox);
    notifyListeners();
    return categories;
  }
}
