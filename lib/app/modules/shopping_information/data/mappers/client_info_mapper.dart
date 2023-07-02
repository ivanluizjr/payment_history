import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';

class ClientInforMapper {
  static ClientInfoEntity fromMap(Map<String, dynamic> map) {
    return ClientInfoEntity(
      name: map["name"],
      cardNumber: map["cardNumber"],
      expirationDate: DateTime.parse(map['expirationDate']),
    );
  }
}
