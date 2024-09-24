  import 'package:flutter/material.dart';

import '../../../themes/theme_colors.dart';

class TextKeyValue extends StatelessWidget {
  final String title;
  final String value;

  const TextKeyValue({super.key,  required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding:  const EdgeInsets.symmetric(vertical: 8  ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // paid
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: ThemeColor.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          //value
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: ThemeColor.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
