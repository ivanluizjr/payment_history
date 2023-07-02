import 'package:dindin_pay/app/core/locales/credit_card_front_locales.dart';
import 'package:dindin_pay/app/core/utils/masks_formatters/mask_formatter.dart';
import 'package:dindin_pay/app/core/value_objects/currency_vo.dart';
import 'package:dindin_pay/app/core/widgets/text_widget.dart';
import 'package:dindin_pay/app/modules/shopping_information/domain/entities/client_info_entity.dart';
import 'package:flutter/material.dart';

import '../../theme/colors/app_colors.dart';

class CreditCardFrontWidget extends StatelessWidget {
  final ClientInfoEntity? clientInfoEntity;
  final String cardNumber;
  final double spent;
  final String available;
  const CreditCardFrontWidget({
    Key? key,
    required this.cardNumber,
    required this.spent,
    required this.available,
    this.clientInfoEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.5, 0.8],
          colors: [
            AppColors.creditCardColor,
            AppColors.creditCardGradientColor,
            //AppColors.purpleDark,
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextWidget(
                  text: MaskFormatter.maskNumberCreditCards(cardNumber),
                  fontSize: 18,
                  colorText: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  'assets/logos/logo_master_card.png',
                  width: 50.0,
                  height: 50.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: CreditCardFrontLocales.spent,
                  fontSize: 14,
                  colorText: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200.0),
                  child: TextWidget(
                    text: CurrencyVO(spent).toString(),
                    fontSize: 14,
                    colorText: Colors.white,
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: CreditCardFrontLocales.available,
                  fontSize: 14,
                  colorText: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 200.0),
                  child: TextWidget(
                    text: 'R\$ 200,00',
                    fontSize: 14,
                    colorText: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
