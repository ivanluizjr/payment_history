import 'package:dindin_pay/app/core/http_dio_client/http_dio_failure.dart';
import 'package:dindin_pay/app/modules/shopping_information/data/mappers/client_info_mapper.dart';
import 'package:dindin_pay/app/modules/shopping_information/data/mappers/purchases_mapper.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/failures/failures.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/respositories/shopping_information_repository.dart';
import 'package:either_dart/src/either.dart';

import '../../datasources/shopping_information_datasource.dart';

class ShoppingInformationRepositoryImpl
    implements IShoppingInformationRepository {
  final IShoppingInformationDatasource datasource;

  ShoppingInformationRepositoryImpl({required this.datasource});

  @override
  Future<Either<IFailures, List<ClientInfoEntity>>> getClientInfo({
    required ClientInfoEntity clientInfoEntity,
  }) async {
    try {
      final List<Map<String, dynamic>> result =
          await datasource.getClientInfo(clientInfoEntity: clientInfoEntity);

      final List<ClientInfoEntity> clients =
          result.map((map) => ClientInforMapper.fromMap(map)).toList();

      return Right(clients);
    } on HttpDioFailure catch (error) {
      return Left(
        ShoppingInformationFailure(
          message: error.message,
        ),
      );
    }
  }

  @override
  Future<Either<IFailures, List<PurchasesEntity>>> getPurchases(
      {required PurchasesEntity purchasesEntity}) async {
    try {
      final List<Map<String, dynamic>> result =
          await datasource.getPurchases(purchasesEntity: purchasesEntity);

      final List<PurchasesEntity> purchases = result
          .map(
            (map) => PurchasesMapper.fromMap(map),
          )
          .toList();

      return Right(purchases);
    } on HttpDioFailure catch (error) {
      return Left(
        ShoppingInformationFailure(
          message: error.message,
        ),
      );
    }
  }
}
