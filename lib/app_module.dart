import 'package:dindin_pay/app/core/routes/app_routes.dart';
import 'package:dindin_pay/app/modules/shopping_information/shopping_information_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute(
          AppRoutes.shoppingInformationRoute,
          module: ShoppingInformationModule(),
        ),
      ];
}
