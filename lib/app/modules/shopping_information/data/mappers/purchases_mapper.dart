import 'package:dindin_pay/app/core/value_objects/currency_vo.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';

class PurchasesMapper {
  static PurchasesEntity fromMap(Map<String, dynamic> map) {
    double value = 0.0;
    if (map['value'] is int) {
      value = (map['value'] as int).toDouble();
    } else if (map['value'] is double) {
      value = map['value'];
    }
    return PurchasesEntity(
      date: DateTime.parse(map["date"] as String),
      store: map["store"],
      description: map["description"],
      value: CurrencyVO(value),
    );
  }
}
