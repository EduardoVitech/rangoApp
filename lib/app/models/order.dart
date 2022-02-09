import 'package:rango_mobile/app/models/shopping_card_model.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCardModel> items;

  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.items,
  });
}
