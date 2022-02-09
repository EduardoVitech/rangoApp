import 'package:get/get.dart';
import 'package:rango_mobile/app/modules/splash/splash_bindings.dart';
import 'package:rango_mobile/app/modules/splash/splash_page.dart';

class SplashRoouters {
  SplashRoouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
