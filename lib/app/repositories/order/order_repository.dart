import 'package:rango_mobile/app/models/order.dart';
import 'package:rango_mobile/app/models/order_pix.dart';

abstract class OrderRepository {
  Future<OrderPix> createOrder(Order order);
}
