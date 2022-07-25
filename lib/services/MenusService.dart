import 'package:flutter/material.dart';
import '../http/httpRestaurant.dart';

class MenusService extends ChangeNotifier {
  MenusService();
  bool processStatus = false;

  Future<bool> getInfo({required String restaurantDataURL, HiveBox}) async {
    processStatus = await fn_httpRestaurant(restaurantDataURL, HiveBox);
    notifyListeners();
    return processStatus;
  }
}
