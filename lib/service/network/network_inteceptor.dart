import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/service/network/network_heder.dart';

class ApiInterceptors {
  getInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        Map<String, dynamic> headers = await ApiHeaders.getHeaders();
        headers.addAll(options.headers);
        options.headers = headers;
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        if (response.statusCode == 401) {
          handleSessionTimeout(response);
          return handler.next(response);
        } else if (response.statusCode == 404 || response.statusCode == 502) {
          response.data = const ApiResult.failure(
              errorMessage: AppString.wentWrong, isError: true);
          return handler.next(response);
        }
        var data = response.data;
        if (response.data.runtimeType == String) {
          data = jsonDecode(data);
        }

        if (response.statusCode == 200 || response.statusCode == 201) {
          response.data = ApiResult.success(
            data: data,
          );
        } else {
          response.data = const ApiResult.failure(
              errorMessage: AppString.wentWrong, isError: true);
        }

        return handler.next(response);
      },
      onError: (e, handler) async {
        if (e.response != null) {
          await handleSocketException();
        }
        e.response?.data =
            ApiResult.failure(errorMessage: e.toString(), isError: true);
        return handler.next(e);
      },
    );
  }

  handleSessionTimeout(dynamic response) async {}

  handleSocketException() async {}
}
