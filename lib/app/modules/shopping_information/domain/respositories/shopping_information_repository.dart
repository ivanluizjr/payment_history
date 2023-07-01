import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/failures/failures.dart';
import 'package:either_dart/either.dart';

abstract class IShoppingInformationRepository {
  Future<Either<IFailures, List<ClientInfoEntity>>> getClientInfo({
    required ClientInfoEntity clientInfoEntity,
  });

  Future<Either<IFailures, List<PurchasesEntity>>> getPurchases({
    required PurchasesEntity purchasesEntity,
  });
}
