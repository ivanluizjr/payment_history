import 'package:flutter/material.dart';

import 'vertical_bar_chart_tile_widget.dart';

class VerticalBarChartWidget extends StatelessWidget {
  final Size size;
  final List<VerticalLineChartTile> tiles;
  final Color backgroundColor;
  final TextStyle valueTextStyle;
  final TextStyle labelTextStyle;
  final double paddingValue;
  final double paddingLabel;
  final EdgeInsetsGeometry padding;

  const VerticalBarChartWidget({
    super.key,
    this.size = const Size(298.0, 107.0),
    this.backgroundColor = Colors.transparent,
    required this.tiles,
    this.valueTextStyle = const TextStyle(
      color: Color(0xFFCBCBCB),
      fontSize: 9,
    ),
    this.labelTextStyle = const TextStyle(
      color: Color(0xFFCBCBCB),
      fontSize: 12,
    ),
    this.paddingValue = 5.0,
    this.paddingLabel = 6.0,
    this.padding = const EdgeInsets.all(0.0),
  });

  VerticalLineChartTile get maxTile {
    return tiles.reduce((value, element) {
      return value.value > element.value ? value : element;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        height: size.height,
        width: size.width,
        color: backgroundColor,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: tiles.map(
              (tile) {
                final tileHeight = tile.value * size.height / maxTile.value;

                return VerticalBarChartTileWidget(
                  tileHeight: tileHeight,
                  tile: tile,
                  chartHeight: size.height,
                  labelTextStyle: labelTextStyle,
                  valueTextStyle: valueTextStyle,
                  paddingValue: paddingValue,
                  paddingLabel: paddingLabel,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
