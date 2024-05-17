import 'package:e_shop/resources/constant/app_url.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/service/network/network_client.dart';

class CartService {
  static Future<ApiResult> getCart(int userId) async {
    var response = await DioClient().get('${AppUrl.userCart}$userId');
    return response;
  }
}
