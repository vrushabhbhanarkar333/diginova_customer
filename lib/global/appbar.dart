import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarNova extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final FontWeight fontWeight;
  final double fontSize;
  final Color color;
  final VoidCallback onPressed;
  final Icon? icon;

  const AppBarNova({
    super.key,
    required this.title,
    required this.fontWeight,
    required this.fontSize,
    required this.color,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: onPressed,
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          size: 18,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(50); // Adjusted preferred size
}
