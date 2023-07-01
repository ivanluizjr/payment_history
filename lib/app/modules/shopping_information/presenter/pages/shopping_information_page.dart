import 'dart:math' as math;

import 'package:dindin_pay/app/core/locales/shopping_page_locales.dart';
import 'package:dindin_pay/app/core/theme/colors/app_colors.dart';
import 'package:dindin_pay/app/core/widgets/credit_card/credit_card_widget.dart';
import 'package:dindin_pay/app/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/locales/date_formatters_locales.dart';
import '../../../../core/widgets/vertical_bar_chart/vertical_bar_chart_rounded_widget.dart';
import '../../../../core/widgets/vertical_bar_chart/vertical_bar_chart_tile_widget.dart';

class ShoppingInformationPage extends StatefulWidget {
  const ShoppingInformationPage({super.key});

  @override
  State<ShoppingInformationPage> createState() =>
      _ShoppingInformationPageState();
}

class _ShoppingInformationPageState extends State<ShoppingInformationPage> {
  double angle = 0;
  bool isFront = true;

  void _flipCard() {
    setState(() {
      angle = (angle + math.pi) % (math.pi * 2);
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.creditCardGradientColor,
        title: const TextWidget(
          text: ShoppingPageLocales.titleApp,
          colorText: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Center(
                child: GestureDetector(
                  onTap: _flipCard,
                  child: CreditCardWidget(
                    name: "Ivan Luiz P P Junior",
                    cardNumber: "1111111211131114",
                    validThru: '12/2024',
                    securityCode: 123,
                    memberSince: '01/2000',
                    angle: angle,
                    spent: '',
                    available: '',
                  ),
                ),
              ),
            ),
            const VerticalBarChartRoundedWidget(
              tiles: [
                VerticalLineChartTile(
                    value: 1, label: DateFormattersLocales.januarySimplified),
                VerticalLineChartTile(
                    value: 2, label: DateFormattersLocales.februarySimplified),
                VerticalLineChartTile(
                    value: 4, label: DateFormattersLocales.marchSimplified),
                VerticalLineChartTile(
                    value: 5, label: DateFormattersLocales.aprilSimplified),
                VerticalLineChartTile(
                    value: 2, label: DateFormattersLocales.maySimplified),
                VerticalLineChartTile(
                    value: 6, label: DateFormattersLocales.juneSimplified),
                VerticalLineChartTile(
                    value: 3, label: DateFormattersLocales.julySimplified),
                VerticalLineChartTile(
                    value: 5, label: DateFormattersLocales.augustSimplified),
                VerticalLineChartTile(
                    value: 4, label: DateFormattersLocales.septemberSimplified),
                VerticalLineChartTile(
                    value: 3, label: DateFormattersLocales.octoberSimplified),
                VerticalLineChartTile(
                    value: 2, label: DateFormattersLocales.novemberSimplified),
                VerticalLineChartTile(
                    value: 5, label: DateFormattersLocales.decemberSimplified),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
