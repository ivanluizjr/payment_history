import 'package:dindin_pay/app/core/http_dio_client/dio/http_dio_client_service_impl.dart';
import 'package:dindin_pay/app/core/routes/app_routes.dart';
import 'package:dindin_pay/app/core/services/service_injector_locator.dart';
import 'package:dindin_pay/app/modules/shopping_information/data/datasources/impl/shopping_information_datasource_impl.dart';
import 'package:dindin_pay/app/modules/shopping_information/data/repositories/impl/shopping_information_repository_impl.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/usecases/get_client_info_usecase.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/usecases/get_purchases_usecase.dart';
import 'package:dindin_pay/app/modules/shopping_information/presenter/cubit/shopping_information_cubit.dart';
import 'package:dindin_pay/app/modules/shopping_information/presenter/pages/shopping_information_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ShoppingInformationModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => ShoppingInformationCubit(
            getClientInfoUsecase: i(),
            getPurchasesUsecase: i(),
          ),
        ),
        Bind.factory(
          (i) => GetClientInfoUsecaseImpl(
            shoppingRepository: i(),
          ),
        ),
        Bind.factory(
          (i) => GetPurchaseUsecaseImpl(
            shoppingRepository: i(),
          ),
        ),
        Bind.factory(
          (i) => ShoppingInformationRepositoryImpl(
            datasource: i(),
          ),
        ),
        Bind.factory(
          (i) => ShoppingInformationDatasourceImpl(
            service: i(),
          ),
        ),
        Bind.factory(
          (i) => HttpDioClientServiceImpl(
            dio: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => ShoppingInformationPage(
            cubit: ServiceInjectorLocatorService.dependency<
                ShoppingInformationCubit>(),
          ),
        ),
      ];
}
