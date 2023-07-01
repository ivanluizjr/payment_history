import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';

import '../../domain/entities/purchases_entity.dart';

abstract class IShoppingInformationDatasource {
  Future<List<Map<String, dynamic>>> getClientInfo({
    required ClientInfoEntity clientInfoEntity,
  });

  Future<List<Map<String, dynamic>>> getPurchases({
    required PurchasesEntity purchasesEntity,
  });
}
