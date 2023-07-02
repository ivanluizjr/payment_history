import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';

abstract class IShoppingInformationState {}

class ShoppingInformationStateStart implements IShoppingInformationState {}

class ShoppingInformationStateLoading implements IShoppingInformationState {
  const ShoppingInformationStateLoading();
}

class ShoppingInformationStateSuccess implements IShoppingInformationState {
  final List<ClientInfoEntity> clientList;
  final List<PurchasesEntity> purchaseList;

  const ShoppingInformationStateSuccess({
    required this.clientList,
    required this.purchaseList,
  });
}

class ShoppingInformationStateFailure implements IShoppingInformationState {
  final String message;

  const ShoppingInformationStateFailure({required this.message});

  @override
  String toString() {
    return message;
  }
}
