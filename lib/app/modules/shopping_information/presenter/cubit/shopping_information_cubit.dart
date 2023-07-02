import 'dart:math';

import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/purchases_entity.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/usecases/get_client_info_usecase.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/usecases/get_purchases_usecase.dart';
import 'package:dindin_pay/app/modules/shopping_information/presenter/cubit/states/shopping_information_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/locales/date_formatters_locales.dart';

class ShoppingInformationCubit extends Cubit<IShoppingInformationState> {
  final IGetClientInfoUsecase getClientInfoUsecase;
  final IGetPurchasesUsecase getPurchasesUsecase;
  List<ClientInfoEntity>? client;
  List<PurchasesEntity>? purchases;

  ShoppingInformationCubit({
    required this.getClientInfoUsecase,
    required this.getPurchasesUsecase,
  }) : super(ShoppingInformationStateStart());

  ClientInfoEntity clientInfoEntity = ClientInfoEntity.empty();
  PurchasesEntity purchasesEntity = PurchasesEntity.empty();

  Future<void> init() async {
    emit(const ShoppingInformationStateLoading());

    final clientInfoResult = await getClientInfoUsecase(
      clientInfoEntity: clientInfoEntity,
    );

    final purchasesResult = await getPurchasesUsecase(
      purchasesEntity: purchasesEntity,
    );

    clientInfoResult.fold(
      (error) {
        emit(
          ShoppingInformationStateFailure(message: error.message),
        );
      },
      (success) {
        client = success;
      },
    );

    purchasesResult.fold(
      (error) {
        emit(
          ShoppingInformationStateFailure(message: error.message),
        );
      },
      (success) {
        purchases = success;
      },
    );

    if (client != null && purchases != null) {
      emit(
        ShoppingInformationStateSuccess(
          clientList: client!,
          purchaseList: purchases!,
        ),
      );
    } else {
      emit(
        const ShoppingInformationStateFailure(message: "Purchase esta vazio"),
      );
    }
  }

  Map<String, double> calculateMonthlySpending(
      List<PurchasesEntity> purchases) {
    Map<String, double> monthlySpending = {};

    for (PurchasesEntity purchase in purchases) {
      String month = DateFormattersLocales.fullMonths[purchase.date.month - 1];

      if (monthlySpending.containsKey(month)) {
        monthlySpending[month] = purchase.value.value;
      } else {
        monthlySpending[month] = purchase.value.value;
      }
    }

    for (String month in DateFormattersLocales.fullMonths) {
      if (!monthlySpending.containsKey(month)) {
        double mockValue = (Random().nextDouble() * 100) + 1;

        monthlySpending[month] = mockValue;
      }
    }

    return monthlySpending;
  }
}
