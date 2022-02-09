import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rango_mobile/app/core/services/auth_service.dart';
import 'package:rango_mobile/app/core/services/shopping_card_service.dart';
import 'package:rango_mobile/app/modules/menu/menu_bindings.dart';
import 'package:rango_mobile/app/modules/menu/menu_page.dart';
import 'package:rango_mobile/app/modules/order/shopping_card/shopping_card_bindings.dart';
import 'package:rango_mobile/app/modules/order/shopping_card/shopping_card_page.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  final ShoppingCardService _shoppingCardService;

  final _tabIndex = 0.obs;
  final _tabs = ['/menu', '/order/shopping_card', '/exit'];

  HomeController({required ShoppingCardService shoppingCardService})
      : _shoppingCardService = shoppingCardService;

  int get tabIndex => _tabIndex.value;

  int get totalProductsInShoppingCards => _shoppingCardService.totalProducts;

  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabs[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabs[index], id: NAVIGATOR_KEY);
    }
  }

  Route? onGeneratedRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBindings(),
        transition: Transition.fadeIn,
      );
    }

    if (settings.name == '/order/shopping_card') {
      return GetPageRoute(
        settings: settings,
        page: () => ShoppingCardPage(),
        binding: ShoppingCardBindings(),
        transition: Transition.fadeIn,
      );
    }
  }
}
