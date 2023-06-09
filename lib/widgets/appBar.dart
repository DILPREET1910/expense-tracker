import 'package:flutter/material.dart';

class WidgetsAppBar extends StatelessWidget implements PreferredSizeWidget {
  late double height;

  WidgetsAppBar({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey[900],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
