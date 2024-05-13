import 'package:e_shop/resources/constant/app_assets.dart';

class AppString {
  static const String eshop = "ESHOP";
  static const String categories = "Popular Categories";
  static const String category = "Category";
  static const String viewAll = "View all";
  static const String newItems = "New Items";
  static const String home = "Home";
  static const String product = "Product";
  static const String favorite = "Favorite";
  static const String cart = "Cart";
  static const String user = "User";
  static const String wentWrong = "Something went wrong";
  static const String error = "Error";
  static const String formatError = "Unable to process the data";
  static const String goodDay = "Good day for shopping";
  static const String productDetail = "Product Detail";
  static const String description = "Description";
  static const String addToCart = "Add to Cart";
}

class AppConstant {
  static const List categoryList = [
    {
      'name': 'Smartphone',
      'imageUrl': AppAssets.smartphones,
      'url': 'smartphones',
    },
    {
      'name': 'Fashion',
      'imageUrl': AppAssets.clothes,
      'url': 'mens-shirts',
    },
    {
      'name': 'Laptop',
      'imageUrl': AppAssets.laptops,
      'url': 'laptops',
    },
    {
      'name': 'Footwear',
      'imageUrl': AppAssets.footwear,
      'url': 'mens-shoes',
    },
    {
      'name': 'Perfume',
      'imageUrl': AppAssets.fragrances,
      'url': 'fragrances',
    },
    {
      'name': 'Furniture',
      'imageUrl': AppAssets.furniture,
      'url': 'furniture',
    },
    {
      'name': 'Grocery',
      'imageUrl': AppAssets.groceries,
      'url': 'groceries',
    },
    {
      'name': 'Decoration',
      'imageUrl': AppAssets.homeDecoration,
      'url': 'home-decoration',
    },
    {
      'name': 'Beauty',
      'imageUrl': AppAssets.skincare,
      'url': 'skincare',
    },
    {
      'name': 'Watches',
      'imageUrl': AppAssets.watches,
      'url': 'mens-watches',
    },
    {
      'name': 'Sun Glass',
      'imageUrl': AppAssets.glasses,
      'url': 'sunglasses',
    },
  ];

  static const List<String> adImageList = [
    AppAssets.ad1,
    AppAssets.ad2,
    AppAssets.ad3,
    AppAssets.ad4
  ];
}
