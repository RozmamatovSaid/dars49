import 'package:flutter/material.dart';

class Iconbuttonitem extends StatelessWidget {
  const Iconbuttonitem({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 40),
    );
  }
}
