import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onClick;
  final double padding;

  const AppIconButton({
    required this.onClick,
    required this.icon,
    this.padding = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      style: IconButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      ),
      icon: Icon(icon),
    );
  }
}
