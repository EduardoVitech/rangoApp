import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rango_mobile/app/core/services/auth_service.dart';
import 'package:rango_mobile/app/core/ui/widgets/icon_badge.dart';
import 'package:rango_mobile/app/core/ui/widgets/rango_appbar.dart';
import 'package:rango_mobile/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RangoAppbar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: Colors.black,
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.list_rounded),
              label: 'Produtos',
            ),
            BottomNavigationBarItem(
              icon: IconBadge(
                icon: Icons.shopping_cart,
                number: controller.totalProductsInShoppingCards,
              ),
              label: 'Carrinho',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app_rounded),
              label: 'Sair',
            ),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGeneratedRouter,
      ),
    );
  }
}
