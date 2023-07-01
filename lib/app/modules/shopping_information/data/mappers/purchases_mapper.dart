import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';

class PurchasesMapper {
  final DateTime date;
  final String store;
  final String description;
  final double value;

  PurchasesMapper({
    required this.date,
    required this.store,
    required this.description,
    required this.value,
  });

  static PurchasesEntity fromMap(Map<String, dynamic> map) {
    return PurchasesEntity(
      date: DateTime.parse(map["date"]),
      store: map["store"],
      description: map["description"],
      value: map["value"],
    );
  }
}
