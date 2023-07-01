import 'package:dindin_pay/app/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class VerticalBarChartTileWidget extends StatefulWidget {
  final double tileHeight;
  final VerticalLineChartTile tile;
  final double chartHeight;
  final double paddingValue;
  final double paddingLabel;
  final TextStyle valueTextStyle;
  final TextStyle labelTextStyle;
  final double borderRadius;

  const VerticalBarChartTileWidget({
    super.key,
    required this.tileHeight,
    required this.tile,
    required this.chartHeight,
    required this.paddingValue,
    required this.paddingLabel,
    required this.valueTextStyle,
    required this.labelTextStyle,
    this.borderRadius = 4,
  });

  @override
  State<VerticalBarChartTileWidget> createState() =>
      _VerticalBarChartTileWidgetState();
}

class _VerticalBarChartTileWidgetState extends State<VerticalBarChartTileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _controller.addListener(animationListener);
    _controller.forward();
  }

  void animationListener() {
    setState(() {
      debugPrint('Animation chart vertical line chart');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(animationListener);
  }

  @override
  Widget build(BuildContext context) {
    final animation = _controller.value;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: animation,
          child: Container(
            width: 17.7,
            height: widget.tileHeight,
            decoration: BoxDecoration(
              color: AppColors.greenAnil,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
        ),
        Positioned(
          bottom: widget.tileHeight + widget.paddingValue,
          child: Opacity(
            opacity: animation,
            child: Text(
              widget.tile.value.toInt().toString(),
              style: widget.valueTextStyle,
            ),
          ),
        ),
        Positioned(
          top: widget.tileHeight + widget.paddingLabel,
          child: Opacity(
            opacity: animation,
            child: Text(
              widget.tile.label,
              style: widget.labelTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class VerticalLineChartTile {
  final double value;
  final String label;

  const VerticalLineChartTile({
    required this.value,
    required this.label,
  });
}
