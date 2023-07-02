class ClientInfoEntity {
  final String name;
  final String cardNumber;
  final DateTime expirationDate;

  ClientInfoEntity({
    required this.name,
    required this.cardNumber,
    required this.expirationDate,
  });

  factory ClientInfoEntity.empty() {
    return ClientInfoEntity(
      cardNumber: '',
      name: '',
      expirationDate: DateTime(2023),
    );
  }
}
