// ignore_for_file: public_member_api_docs, prefer_match_file_name

import 'package:flutter/material.dart';

class FontSizes {
  static const double main = 24.0;
  static const double info = 14.0;
}

class AppTextStyles {
  static const EdgeInsets infoTextPadding = EdgeInsets.symmetric(
    horizontal: 40.0,
  );

  static TextStyle main(Color color) =>
      TextStyle(color: color, fontSize: FontSizes.main);

  static TextStyle info(Color color) =>
      TextStyle(color: color, fontSize: FontSizes.info);
}

class AppColors {
  static const Color lightText = Color(0xFF403939);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
}
