import 'dart:math' as math;

import 'package:dindin_pay/app/core/widgets/credit_card/credit_card_back_widget.dart';
import 'package:dindin_pay/app/core/widgets/credit_card/credit_card_front_widget.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String name;
  final String cardNumber;
  final double spent;
  final String available;
  final String memberSince;
  final String validThru;
  final int securityCode;
  final double angle;
  const CreditCardWidget({
    Key? key,
    required this.name,
    required this.cardNumber,
    required this.validThru,
    required this.securityCode,
    required this.angle,
    required this.memberSince,
    required this.available,
    required this.spent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: angle),
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context, double val, __) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(val),
          child: Card(
            elevation: 10,
            color: Colors.transparent,
            child: (val >= math.pi / 2)
                ? CreditCartBackWidget(
                    name: name,
                    memberSince: memberSince,
                    validThru: validThru,
                    securityCode: securityCode,
                  )
                : CreditCardFrontWidget(
                    cardNumber: cardNumber,
                    spent: spent,
                    available: available,
                  ),
          ),
        );
      },
    );
  }
}
