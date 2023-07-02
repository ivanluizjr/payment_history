import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/failures/failures.dart';
import 'package:either_dart/either.dart';

import '../respositories/shopping_information_repository.dart';

abstract class IGetClientInfoUsecase {
  Future<Either<IFailures, List<ClientInfoEntity>>> call({
    required ClientInfoEntity clientInfoEntity,
  });
}

class GetClientInfoUsecaseImpl implements IGetClientInfoUsecase {
  final IShoppingInformationRepository shoppingRepository;

  GetClientInfoUsecaseImpl({required this.shoppingRepository});

  @override
  Future<Either<IFailures, List<ClientInfoEntity>>> call({
    required ClientInfoEntity clientInfoEntity,
  }) async {
    final response = await shoppingRepository.getClientInfo(
      clientInfoEntity: clientInfoEntity,
    );

    return response;
  }
}
