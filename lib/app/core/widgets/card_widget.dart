import 'package:dindin_pay/app/core/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final Widget children;
  final Color? boxShadow;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  const CardWidget({
    this.padding,
    this.backgroundColor,
    required this.children,
    this.boxShadow,
    this.gradient,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    super.key,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.gradient,
        borderRadius: widget.borderRadius ??
            const BorderRadius.all(
              Radius.circular(10.0),
            ),
        boxShadow: [
          BoxShadow(
            color: widget.boxShadow ?? AppColors.creditCardGradientColor,
            blurRadius: 10,
          ),
        ],
        border: widget.border,
      ),
      child: widget.children,
    );
  }
}
