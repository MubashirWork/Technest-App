import 'package:flutter/cupertino.dart';
import 'package:technest/core/constants/app_colors.dart';
class AppText extends StatelessWidget {
  final String data;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  final Color textColor;
  final TextOverflow overflow;

  const AppText({
    super.key,
    required this.data,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.align = TextAlign.start,
    this.textColor = AppColors.primaryColor,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      textAlign: align,
      overflow: overflow,
    );
  }
}
