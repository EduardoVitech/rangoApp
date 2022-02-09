import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rango_mobile/app/core/bindings/aplication_bindings.dart';
import 'package:rango_mobile/app/core/ui/rango_ui.dart';
import 'package:rango_mobile/app/routes/auth_routers.dart';
import 'package:rango_mobile/app/routes/home_routers.dart';
import 'package:rango_mobile/app/routes/orders_routers.dart';
import 'package:rango_mobile/app/routes/product_routers.dart';
import 'package:rango_mobile/app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const RangoMainApp());
}

class RangoMainApp extends StatelessWidget {
  const RangoMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rango Delivery',
      theme: RangoUI.theme,
      initialBinding: AplicationBindings(),
      getPages: [
        ...SplashRoouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...ProductRouters.routers,
        ...OrdersRouters.routers,
      ],
    );
  }
}
