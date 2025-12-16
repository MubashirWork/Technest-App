import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onClick;
  final String text;

  const AppTextButton({required this.onClick, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(0),
      ),
      child: Text(text, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
    );
  }
}
