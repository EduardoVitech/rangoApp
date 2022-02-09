import 'package:get/get.dart';
import 'package:rango_mobile/app/core/rest_client/rest_client.dart';
import 'package:rango_mobile/app/core/services/shopping_card_service.dart';

class AplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      fenix: true,
    );
    Get.lazyPut(() => ShoppingCardService());
  }
}
