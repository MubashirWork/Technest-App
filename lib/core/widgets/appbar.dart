import 'package:flutter/material.dart';
import 'package:technest/core/widgets/app_text.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const Appbar({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.maybePop(context);
        },
        style: IconButton.styleFrom(
          overlayColor: Colors.transparent,
          padding: EdgeInsets.all(0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: Icon(Icons.arrow_back),
      ),
      title: AppText(
        data: text,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
