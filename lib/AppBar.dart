import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 95,
      leadingWidth: 70,
      centerTitle: false,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "Jost",
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: const Color(0xff380565),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 36),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(95);
}
