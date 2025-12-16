import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  final double padding;
  final Color containerColor;
  final Color borderColor;
  final Widget child;

  const AppContainer({
    this.padding = 8,
    this.containerColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor, ),
      ),
      child: child,
    );
  }
}
