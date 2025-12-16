import 'package:flutter/material.dart';
import 'package:technest/core/constants/app_colors.dart';

class AppOutlinedButton extends StatelessWidget {

  final VoidCallback onClick;
  final Widget child;
  final Color foregroundColor;
  final double radius;
  final double borderWidth;
  final Color borderColor;
  final double horizontalPadding;
  final double verticalPadding;


  const AppOutlinedButton({
    super.key,
    required this.onClick,
    required this.child,
    this.foregroundColor = AppColors.primaryColor,
    this.radius = 8,
    this.borderWidth = 1,
    this.borderColor = AppColors.primaryColor,
    this.horizontalPadding = 14,
    this.verticalPadding = 12,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onClick,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        side: BorderSide(color: borderColor, width: borderWidth),
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        minimumSize: Size(double.infinity, 5)
      ),
      child: child,
    );
  }
}
