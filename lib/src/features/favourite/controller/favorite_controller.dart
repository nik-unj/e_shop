import 'package:e_shop/src/features/product/model/product_model.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxList<Product> favoriteProducts = RxList<Product>();

  void addFavorite(Product product) {
    favoriteProducts.add(product);
  }

  void removeFavorite(int pid) {
    favoriteProducts.removeWhere((element) => element.id == pid);
  }

  bool isItemInFavorite(int pid) {
    for (Product p in favoriteProducts) {
      if (pid == p.id) {
        return true;
      }
    }
    return false;
  }
}
