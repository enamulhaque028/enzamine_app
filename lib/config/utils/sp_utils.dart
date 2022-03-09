import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  /* :::::::::::::::::::::::::::::::: API RESPONSE ::::::::::::::::::::::::::::::::::*/
  Future<bool> setLoginResponse(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('API_RESP', value);
  }
  
  Future<String?> getLoginResponse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('API_RESP');
  }
}