import 'dart:convert';
import 'package:e_shop/service/api/api_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static Future<String?> getAuthToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return preference.getString('auth_token');
  }

  static Future<void> setAuthToken(String token) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    preference.setString('auth_token', token);
  }

  static Future<void> setUser(Map user) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String encodedMap = json.encode(user);
    preference.setString('user', encodedMap);
  }

  static Future<ApiResult> getUser() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    return ApiResult.success(
        data: json.decode(preference.getString('user') ?? ''));
  }
}
