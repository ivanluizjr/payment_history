class PurchasesEntity {
  final DateTime date;
  final String store;
  final String description;
  final double value;

  PurchasesEntity({
    required this.date,
    required this.store,
    required this.description,
    required this.value,
  });
}
