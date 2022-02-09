import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rango_mobile/app/modules/menu/menu_controller.dart';
import 'package:rango_mobile/app/modules/menu/widgets/product_tile.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: controller.refreshPage,
        child: ListView.builder(
          itemCount: controller.menu.length,
          itemBuilder: (context, index) {
            final prod = controller.menu[index];
            return ProductTile(product: prod);
          },
        ),
      );
    });
  }
}
