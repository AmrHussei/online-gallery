import 'package:flutter/material.dart';

import '../my_colors.dart';

class TextUtils extends StatelessWidget {
  final String text;

  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underLine;

  const TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.underLine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: MyColors.blackMainText,
        decoration: underLine,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
