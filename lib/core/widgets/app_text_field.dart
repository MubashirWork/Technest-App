import 'package:flutter/material.dart';
import 'package:technest/core/constants/app_colors.dart';
import 'package:technest/core/widgets/app_text.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixOnClick;
  final double radius;
  final Color borderColor;
  final double borderWidth;
  final bool hideText;
  final double horizontalPadding;
  final double verticalPadding;
  final TextInputType keyboardType;
  final VoidCallback? onClick;
  final bool readOnly;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixOnClick,
    this.radius = 8,
    this.borderColor = AppColors.primaryColor,
    this.borderWidth = 1,
    this.hideText = false,
    this.horizontalPadding = 14,
    this.verticalPadding = 12,
    this.keyboardType = TextInputType.text, this.onClick,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 14),
      controller: controller,
      decoration: InputDecoration(
        label: AppText(data: label, fontSize: 14),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
              highlightColor: Colors.transparent,
              onPressed: suffixOnClick ?? () {},
              icon: Icon(suffixIcon),
            )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
      ),
      obscureText: hideText,
      keyboardType: keyboardType,
      readOnly: readOnly,
    );
  }
}
