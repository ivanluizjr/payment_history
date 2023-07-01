import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? colorText;
  final String? fontFamily;
  final double? fontSize;
  final TextStyle? textStyle;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? textOverflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? heigth;
  final TextDecoration? textDecoration;
  final double? decorationThickness;
  final double? letterSpacing;
  final Color? decorationColor;

  const TextWidget({
    required this.text,
    this.colorText,
    this.fontFamily,
    this.fontSize,
    this.textStyle,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.textOverflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.fontWeight,
    this.fontStyle,
    this.heigth,
    this.textDecoration,
    this.decorationThickness,
    this.letterSpacing,
    super.key,
    this.decorationColor,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: GoogleFonts.inter(
        letterSpacing: letterSpacing,
        color: colorText ?? Colors.black,
        decorationThickness: decorationThickness,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        height: heigth,
        decoration: textDecoration,
        decorationColor: decorationColor,
      ),
    );
  }
}
