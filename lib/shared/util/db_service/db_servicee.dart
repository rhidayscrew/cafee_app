import 'package:shared_preferences/shared_preferences.dart';

class DBServicee {
  //static final DBService _instance = DBService._internal();
  static SharedPreferences? prefs;
  // static late SharedPreferences prefs;
  // DBService._internal();
  // factory DBService() {
  //   return _instance;
  // }

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String? get(String key) {
    return prefs?.getString(key);
  }

  static Future set(String key, String value) async {
    await prefs?.setString(key, value);
  }
}


// // Ketika login Email di inget  gak perlu diketik lagi pake Teknik ini 
// // dart pub add shared_preferences    26.24
// // membuat db service

// // Ketika login Email di inget  gak perlu diketik lagi pake Teknik ini 
// // dart pub add shared_preferences    26.24
// // membuat db service