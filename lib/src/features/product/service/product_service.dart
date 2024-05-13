import 'package:e_shop/resources/constant/app_url.dart';
import 'package:e_shop/service/api/api_result.dart';
import 'package:e_shop/service/network/network_client.dart';

class ProductService {
  static Future<ApiResult> getProductsByCategory(String category) async {
    var response = await DioClient().get('${AppUrl.productCatgory}$category');
    return response;
  }

  static Future<ApiResult> searchProduct(String name) async {
    var response = await DioClient().get('${AppUrl.productSearch}$name');
    return response;
  }
}
