import 'package:shared_preferences/shared_preferences.dart';

//Shared Preferences functions
class SharedPreferencesStorage {

  static Future<bool> checkSharedPreference(s_key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey(s_key)) {
      return true;
    }

     return false;

  }

  static Future<void> setSharedPreference(s_type, s_key, value) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    s_key = s_key.toLowerCase();

    switch(s_type) {
      case 'int':
        prefs.setInt(s_key, value);
        break;
      case 'string':
        prefs.setString(s_key, value);
        break;
      case 'bool':
        prefs.setBool(s_key, value);
        break;
      default:
        return false;
    }

    return true;
  }


  static Future getSharedPreference(s_type, s_key) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    s_key = s_key.toLowerCase();

    switch(s_type) {
      case 'int':
        prefs.getInt(s_key);
        break;
      case 'string':
        prefs.getString(s_key);
        break;
      case 'bool':
        prefs.getBool(s_key);
        break;
      default:
        return false;
    }

    return true;
  }



  static Future<String> getSharedPreferenceString(s_key) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString(s_key);

  }

}