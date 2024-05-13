import 'package:e_shop/service/shared_pref/shared_pref.dart';

class ApiHeaders {
  static Future<Map<String, dynamic>> getHeaders({String? tempToken}) async {
    String? token;
    token = await SharedPrefService.getAuthToken();
    if (token == '') {
      token = tempToken ?? '';
    }

    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'access_token': token,
    };

    return headers;
  }
}
