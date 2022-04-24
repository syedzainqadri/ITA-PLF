import 'package:shared_preferences/shared_preferences.dart';

class MyHelper {
  static saveLoginDetails({String email, String userId, String name}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("email", email);
    preferences.setString("name", name);
    preferences.setString("user_id", userId);
    return true;
  }

  static saveItemToCart({id, quantity}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("$id", id);
    preferences.setString("${id + quantity}", id);
  }

  static Future<bool> checkLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool("logggedIn") ?? false;
  }

  static saveTokens({loginToken, authToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", loginToken);
    preferences.setString("authToken", authToken);
  }

  static Future<String> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString("token") ?? null;
  }

  static clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  static getUserInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String email = preferences.getString("email");
    String name = preferences.getString("name");
    String phone = preferences.getString("phone");
    String token = preferences.getString("token");
    return name;
    Map<String, dynamic> data = {};
    data["email"] = email;
    data["phone"] = phone;
    data["name"] = name;
    data["token"] = token;
    return data;
  }
}
