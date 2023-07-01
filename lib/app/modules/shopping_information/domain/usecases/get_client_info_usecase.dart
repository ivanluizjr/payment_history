import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/failures/failures.dart';
import 'package:either_dart/either.dart';

import '../respositories/shopping_information_repository.dart';

abstract class IGetClientInfoUsecase {
  Future<Either<IFailures, List<ClientInfoEntity>>> call({
    required ClientInfoEntity clientInfoEntity,
  });
}

class GetClientInfoUsecase implements IGetClientInfoUsecase {
  final IShoppingInformationRepository repositoryClient;

  GetClientInfoUsecase({required this.repositoryClient});

  @override
  Future<Either<IFailures, List<ClientInfoEntity>>> call({
    required ClientInfoEntity clientInfoEntity,
  }) async {
    final response = await repositoryClient.getClientInfo(
      clientInfoEntity: clientInfoEntity,
    );

    return response;
  }
}
