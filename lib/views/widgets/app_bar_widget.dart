import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.brown,
      title: Text("App", style: TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
