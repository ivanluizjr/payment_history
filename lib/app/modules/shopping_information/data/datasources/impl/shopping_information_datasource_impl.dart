import 'package:dindin_pay/app/core/http_dio_client/http_dio_client_service.dart';
import 'package:dindin_pay/app/core/locales/api_locales.dart';
import 'package:dindin_pay/app/modules/shopping_information/data/datasources/shopping_information_datasource.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';

class ShoppingInformationDatasourceImpl
    implements IShoppingInformationDatasource {
  final IHttpDioClientService service;

  ShoppingInformationDatasourceImpl({required this.service});

  @override
  Future<List<Map<String, dynamic>>> getClientInfo({
    required ClientInfoEntity clientInfoEntity,
  }) async {
    final response = await service.get(ApiLocales.clientInfoData);

    if (response.data is List) {
      return List<Map<String, dynamic>>.from(response.data);
    }

    return response.data;
  }

  @override
  Future<List<Map<String, dynamic>>> getPurchases({
    required PurchasesEntity purchasesEntity,
  }) async {
    final response = await service.get(ApiLocales.purchasesData);

    if (response.data is List) {
      return List<Map<String, dynamic>>.from(response.data);
    }

    return response.data;
  }
}
