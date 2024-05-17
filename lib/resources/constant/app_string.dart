import 'package:e_shop/resources/constant/app_assets.dart';
import 'package:e_shop/src/features/product/model/product_model.dart';

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
  static const String removeFromCart = "Remove from Cart";
  static const String mycart = "My Cart";
  static const String showPassword = "Show Password";
  static const String login = "Login";
  static const String settingUp = "Setting things up";
  static const String subTotal = "Subtotal";
  static const String discount = "Discount";
  static const String total = "Total";
  static const String saved = "You Saved";
  static const String buy = "Proceed to buy";
  static const String noProduct = "No Product";
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

  static Product dummyProduct = Product(
    id: 1,
    title: " iPhone 9",
    description: "An apple mobile which is nothing like apple",
    price: 549,
    discountPercentage: 12.96,
    rating: 4.69,
    stock: 94,
    brand: "Apple",
    category: "smartphones",
    thumbnail: "https://cdn.dummyjson.com/product-images/10/2.jpg",
    images: [],
  );
}
