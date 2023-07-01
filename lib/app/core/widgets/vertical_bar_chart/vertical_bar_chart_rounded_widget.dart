import 'package:dindin_pay/app/core/widgets/vertical_bar_chart/vertical_bar_chart_tile_widget.dart';
import 'package:dindin_pay/app/core/widgets/vertical_bar_chart/vertical_bar_chart_widget.dart';
import 'package:flutter/material.dart';

import '../../services/media_query_service.dart';
import '../../theme/colors/app_colors.dart';
import '../text_widget.dart';

class VerticalBarChartRoundedWidget extends StatelessWidget {
  final List<VerticalLineChartTile> tiles;
  final String? title;

  const VerticalBarChartRoundedWidget({
    super.key,
    this.tiles = const [],
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQueryService.width(context) * 0.90;
    const chartHeight = 107.0;
    const paddingValue = 5.0;
    const paddingLabel = 5.0;

    return SizedBox(
      width: width,
      height: 185,
      // decoration: BoxDecoration(
      //   borderRadius: const BorderRadius.only(
      //     topLeft: Radius.circular(5.0),
      //     topRight: Radius.circular(5.0),
      //   ),
      //   border: Border.all(
      //     color: Colors.grey.shade500,
      //     width: 2,
      //   ),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextWidget(
                text: title ?? '',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                colorText: Colors.white70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 21.0,
              top: 15,
            ),
            child: VerticalBarChartWidget(
              padding: EdgeInsets.symmetric(
                horizontal: width <= 320 ? 16.0 : 22.0,
              ),
              backgroundColor: AppColors.graphicBackgroundColor,
              tiles: tiles,
              size: Size(
                width,
                chartHeight + paddingValue + paddingLabel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
