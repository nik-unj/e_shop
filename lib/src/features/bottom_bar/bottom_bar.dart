import 'package:e_shop/resources/constant/app_string.dart';
import 'package:e_shop/resources/constant/app_style.dart';
import 'package:e_shop/resources/constant/global.dart';
import 'package:e_shop/src/features/cart/cart_screen.dart';
import 'package:e_shop/src/features/cart/controller/cart_controller.dart';
import 'package:e_shop/src/features/favourite/controller/favorite_controller.dart';
import 'package:e_shop/src/features/favourite/favorite_scree.dart';
import 'package:e_shop/src/features/home/controller/home_controller.dart';
import 'package:e_shop/src/features/home/home_screen.dart';
import 'package:e_shop/src/features/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final homeController = Get.put(HomeController());
  final productController = Get.put(ProductController());
  final cartController = Get.put(CartController());
  final favoriteController = Get.put(FavoriteController());

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    Container(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndexBottomBar.value = index;
    });
  }

  List<IconData> navIcons = [
    FontAwesomeIcons.house,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> navTitle = [
    AppString.home,
    AppString.favorite,
    AppString.cart,
    AppString.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            _widgetOptions.elementAt(selectedIndexBottomBar.value),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 70,
                  width: AppStyle.width(context),
                  decoration: BoxDecoration(
                    color: AppStyle.offWhite,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: AppStyle.grey,
                        blurRadius: 2,
                        spreadRadius: 0.2,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: navIcons.map((icon) {
                        int index = navIcons.indexOf(icon);
                        return GestureDetector(
                          onTap: () {
                            onItemTapped(index);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icon,
                                color: selectedIndexBottomBar.value == index
                                    ? AppStyle.primary
                                    : AppStyle.black,
                              ),
                              Text(
                                navTitle[index],
                                style: AppStyle.normalText().copyWith(
                                  color: selectedIndexBottomBar.value == index
                                      ? AppStyle.primary
                                      : AppStyle.black,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
