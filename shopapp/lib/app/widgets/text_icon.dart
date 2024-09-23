import 'package:flutter/material.dart';

import '../themes/theme_colors.dart';

class TextIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;

  const TextIcon({super.key, required this.text, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 40,
              height: 40,
              child: CircleAvatar(
                radius: 30.0,
                  backgroundColor: ThemeColor.primaryBlue,
                  child: Icon(icon, color: ThemeColor.white, size: 25))),
          const SizedBox(width: 10,),
          Text(text, style: const TextStyle(color: ThemeColor.primaryBlack, fontSize: 15, fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}

