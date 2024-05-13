import 'package:e_shop/resources/constant/app_url.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/service/network/network_client.dart';

class HomeService {
  static Future<ApiResult> getProducts(int page) async {
    var response = await DioClient()
        .get('${AppUrl.product}?limit=10&skip=${page * 10 - 10}');
    return response;
  }
}
