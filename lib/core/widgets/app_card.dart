import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {

  final double padding;
  final Widget child;

  const AppCard({this.padding = 8, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: Colors.grey,
          width: 1
        ),
      ),
      color: Colors.white,
      elevation: 3,
      child: Padding(padding: EdgeInsets.all(8), child: child,),
    );
  }
}
