import 'dart:math' as math;

import 'package:dindin_pay/app/core/locales/shopping_page_locales.dart';
import 'package:dindin_pay/app/core/services/snack_bar_service.dart';
import 'package:dindin_pay/app/core/theme/colors/app_colors.dart';
import 'package:dindin_pay/app/core/utils/date_formatters/date_formatter.dart';
import 'package:dindin_pay/app/core/widgets/bottom_navigator_bar_widget.dart';
import 'package:dindin_pay/app/core/widgets/card_widget.dart';
import 'package:dindin_pay/app/core/widgets/credit_card/credit_card_widget.dart';
import 'package:dindin_pay/app/core/widgets/text_widget.dart';
import 'package:dindin_pay/app/modules/shopping_information/presenter/cubit/shopping_information_cubit.dart';
import 'package:dindin_pay/app/modules/shopping_information/presenter/cubit/states/shopping_information_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/locales/date_formatters_locales.dart';
import '../../../../core/services/media_query_service.dart';
import '../../../../core/widgets/vertical_bar_chart/vertical_bar_chart_rounded_widget.dart';
import '../../../../core/widgets/vertical_bar_chart/vertical_bar_chart_tile_widget.dart';

class ShoppingInformationPage extends StatefulWidget {
  final ShoppingInformationCubit cubit;

  const ShoppingInformationPage({
    super.key,
    required this.cubit,
  });

  @override
  State<ShoppingInformationPage> createState() =>
      _ShoppingInformationPageState();
}

class _ShoppingInformationPageState extends State<ShoppingInformationPage> {
  double angle = 0;
  bool isFront = true;
  int pageIndex = 0;
  bool isCardOrGraphic = true;

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    widget.cubit.init();

    widget.cubit.stream.listen((state) {
      if (state is ShoppingInformationStateFailure) {
        SnackBarService.showError(
          context: context,
          message: ShoppingPageLocales.errorMessage,
        );
      }
    });
  }

  void _flipCard() {
    setState(() {
      angle = (angle + math.pi) % (math.pi * 2);
      isFront = !isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQueryService.height(context);
    final screenWidth = MediaQueryService.width(context);

    // final blockSizeHorizontal = screenWidth / 100;
    // final blockSizeVertical = screenHeight / 100;
    // double containerWidth = blockSizeHorizontal * 10.0;
    // double containerHeight = blockSizeVertical * 90.0;

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
        child: BlocBuilder<ShoppingInformationCubit, IShoppingInformationState>(
          bloc: widget.cubit,
          builder: (context, state) {
            if (state is ShoppingInformationStateLoading) {
              return Shimmer.fromColors(
                baseColor: AppColors.creditCardColor, // Cor base do shimmer
                highlightColor: AppColors
                    .creditCardGradientColor, // Cor de destaque do shimmer
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  color: Colors.white,
                ),
              );
            } else if (state is ShoppingInformationStateSuccess) {
              widget.cubit.client = state.clientList;
              widget.cubit.purchases = state.purchaseList;
              double totalValue = widget.cubit.purchases!.fold(
                0.0,
                ((previousValue, purchases) =>
                    previousValue + purchases.value.value),
              );
              Map<String, double> monthlySpending = widget.cubit
                  .calculateMonthlySpending(widget.cubit.purchases ?? []);

              return Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Visibility(
                      visible: isCardOrGraphic,
                      replacement: VerticalBarChartRoundedWidget(
                        tiles:
                            DateFormattersLocales.monthsSimplified.map((month) {
                          int monthIndex = DateFormattersLocales
                              .monthsSimplified
                              .indexOf(month);
                          String fullMonth =
                              DateFormattersLocales.fullMonths[monthIndex];

                          return VerticalLineChartTile(
                            value: monthlySpending[fullMonth] ?? 0,
                            label: month,
                          );
                        }).toList(),
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: GestureDetector(
                            onTap: _flipCard,
                            child: CreditCardWidget(
                              name: state.clientList.first.name,
                              cardNumber: state.clientList.first.cardNumber,
                              validThru: '12/24',
                              securityCode: 123,
                              memberSince: '01/2000',
                              angle: angle,
                              spent: totalValue,
                              available: '',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 30.0,
                        left: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: ShoppingPageLocales.payments,
                            colorText: AppColors.creditCardColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 10.0,
                          right: 10.0,
                          bottom: 10.0,
                        ),
                        itemCount: state.purchaseList.length,
                        //list.length,
                        itemBuilder: (context, index) {
                          final cardData = state.purchaseList[index];
                          return CardWidget(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            height: 120,
                            backgroundColor: AppColors.creditCardGradientColor,
                            children: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                        text: ShoppingPageLocales.payDay,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        colorText: AppColors.greenAnil,
                                      ),
                                      TextWidget(
                                        text: DateFormatter.formatDateString(
                                          cardData.date,
                                        ),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        colorText: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                        text: ShoppingPageLocales.paymentStore,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        colorText: AppColors.greenAnil,
                                      ),
                                      TextWidget(
                                        text: cardData.store,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        colorText: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                        text: ShoppingPageLocales
                                            .paymentDescription,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        colorText: AppColors.greenAnil,
                                      ),
                                      TextWidget(
                                        text: cardData.description,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        colorText: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                        text: ShoppingPageLocales.paymentValue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        colorText: AppColors.greenAnil,
                                      ),
                                      TextWidget(
                                        text: cardData.value.toString(),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        colorText: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10.0,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigatorBarWidget(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(
            () {
              pageIndex = index;
              isCardOrGraphic = index == 0;
            },
          );
        },
      ),
    );
  }
}
