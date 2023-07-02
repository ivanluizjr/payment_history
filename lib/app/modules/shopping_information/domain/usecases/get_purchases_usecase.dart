import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/failures/failures.dart';
import 'package:either_dart/either.dart';

import '../respositories/shopping_information_repository.dart';

abstract class IGetPurchasesUsecase {
  Future<Either<IFailures, List<PurchasesEntity>>> call({
    required PurchasesEntity purchasesEntity,
  });
}

class GetPurchaseUsecaseImpl implements IGetPurchasesUsecase {
  final IShoppingInformationRepository shoppingRepository;

  GetPurchaseUsecaseImpl({required this.shoppingRepository});

  @override
  Future<Either<IFailures, List<PurchasesEntity>>> call({
    required PurchasesEntity purchasesEntity,
  }) async {
    final response = await shoppingRepository.getPurchases(
      purchasesEntity: purchasesEntity,
    );

    return response;
  }
}
