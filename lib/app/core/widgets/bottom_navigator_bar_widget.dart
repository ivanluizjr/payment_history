import 'package:dindin_pay/app/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigatorBarWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigatorBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<BottomNavigatorBarWidget> createState() =>
      _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.creditCardGradientColor,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.credit_card,
          ),
          label: 'Cartão',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.equalizer_outlined,
          ),
          label: 'Grafico de Gastos',
        ),
      ],
      currentIndex: widget.currentIndex,
      unselectedFontSize: 12,
      unselectedItemColor: AppColors.creditCardColor,
      selectedItemColor: AppColors.greenAnil,
      selectedFontSize: 20,
      selectedIconTheme: const IconThemeData(
        color: AppColors.creditCardColor,
        size: 40,
      ),
      onTap: widget.onTap,
    );
  }
}
