import 'package:dindin_pay/app/core/routes/app_routes.dart';
import 'package:dindin_pay/app/modules/shopping_information/presenter/pages/shopping_information_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ShoppingInformationModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => const ShoppingInformationPage(),
        ),
      ];
}
