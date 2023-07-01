import 'package:dindin_pay/app/modules/splash/presenter/pages/splash_page_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/routes/app_routes.dart';


class SplashModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => const SplashPagePage(),
        )
      ];
}
