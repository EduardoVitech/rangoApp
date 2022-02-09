import 'package:get/get.dart';
import 'package:rango_mobile/app/core/services/auth_service.dart';
import 'package:rango_mobile/app/core/services/shopping_card_service.dart';
import 'package:rango_mobile/app/models/order.dart';
import 'package:rango_mobile/app/models/shopping_card_model.dart';
import 'package:rango_mobile/app/modules/home/home_controller.dart';
import 'package:rango_mobile/app/repositories/order/order_repository.dart';

class ShoppingCardController extends GetxController {
  final AuthService _authService;
  final ShoppingCardService _shoppingCardService;
  final OrderRepository _orderRepository;

  final _addRess = ''.obs;
  final _cpf = ''.obs;

  ShoppingCardController({
    required AuthService authService,
    required ShoppingCardService shoppingCardService,
    required OrderRepository orderRepository,
  })  : _authService = authService,
        _shoppingCardService = shoppingCardService,
        _orderRepository = orderRepository;

  List<ShoppingCardModel> get products => _shoppingCardService.products;

  double get totalValue => _shoppingCardService.totalValue;

  set address(String address) => _addRess.value = address;
  set cpf(String cpf) => _cpf.value = cpf;

  void addQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity + 1,
    );
  }

  void subtractQuantityInProduct(ShoppingCardModel shoppingCardModel) {
    _shoppingCardService.addAndRemoveProductInShoppingCard(
      shoppingCardModel.product,
      quantity: shoppingCardModel.quantity - 1,
    );
  }

  void clear() => _shoppingCardService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _addRess.value,
      items: products,
    );
    var orderPix = await _orderRepository.createOrder(order);
    orderPix = orderPix.copyWith(totalValue: totalValue);

    clear();
    Get.offNamed('/order/finished', arguments: orderPix);
    Get.back(id: HomeController.NAVIGATOR_KEY);
  }
}
