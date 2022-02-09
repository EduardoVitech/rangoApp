import 'package:get/get.dart';
import 'package:rango_mobile/app/modules/order/finished/finished_page.dart';
import 'package:rango_mobile/app/modules/order/pix/pix_page.dart';

class OrdersRouters {
  OrdersRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/order/finished',
      page: () => FinishedPage(),
    ),
    GetPage(
      name: '/order/pix',
      page: () => PixPage(),
    ),
  ];
}
