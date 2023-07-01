import 'package:dindin_pay/app/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/services/media_query_service.dart';

class SplashPagePage extends StatefulWidget {
  const SplashPagePage({super.key});

  @override
  _SplashPagePageState createState() => _SplashPagePageState();
}

class _SplashPagePageState extends State<SplashPagePage> {
  Future splashNavigation() {
    return Future.delayed(
      const Duration(seconds: 3),
      () async {
        Modular.to.pushNamed(AppRoutes.shoppingInformationRoute);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    splashNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQueryService.width(context),
        height: MediaQueryService.height(context),
        color: AppColors.creditCardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logos/logo_dindin.png'),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
