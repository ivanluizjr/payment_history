import 'package:dindin_pay/app/core/value_objects/currency_vo.dart';

class PurchasesEntity {
  final DateTime date;
  final String store;
  final String description;
  final CurrencyVO value;

  PurchasesEntity({
    required this.date,
    required this.store,
    required this.description,
    required this.value,
  });

  factory PurchasesEntity.empty() {
    return PurchasesEntity(
      date: DateTime(0),
      store: '',
      description: '',
      value: const CurrencyVO(0.0),
    );
  }
}
