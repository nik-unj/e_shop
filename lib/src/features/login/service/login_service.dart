import 'dart:convert';

import 'package:e_shop/resources/constant/app_url.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/service/network/network_client.dart';

class LoginService {
  static Future<ApiResult> userLogin(String userName, String password) async {
    var data = json.encode({"username": userName, "password": password});
    var response = await DioClient().post(AppUrl.login, data: data);
    return response;
  }
}
