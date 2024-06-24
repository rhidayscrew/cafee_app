import 'package:shared_preferences/shared_preferences.dart';

class DBServicee {
  static SharedPreferences? prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String? get(String key) {
    return prefs?.getString(key);
  }

  static clear(String key) async {
    await prefs?.remove(key);
  }

  static set(String key, String value) async {
    await prefs?.setString(key, value);
  }
}



// // Ketika login Email di inget  gak perlu diketik lagi pake Teknik ini 
// // dart pub add shared_preferences    26.24
// // membuat db service




