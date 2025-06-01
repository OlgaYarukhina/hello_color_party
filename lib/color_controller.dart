// ignore_for_file: no_magic_number, public_member_api_docs

import 'package:flutter/material.dart';
import 'package:hello_color_party/app_styles.dart';
import 'package:hello_color_party/models/color_composition.dart';
import 'package:hello_color_party/models/color_generator.dart';

class ColorController extends ChangeNotifier {
  final ColorGenerator _colorGenerator = ColorGenerator();
  Color _backgroundColor = AppColors.white;
  bool _showInfoText = true;

  Color get backgroundColor => _backgroundColor;
  bool get showInfoText => _showInfoText;
  ColorComposition get currentComposition =>
      _colorGenerator.currentColorComposition;

  void changeColor() {
    _backgroundColor = _colorGenerator.generateRandomColor();
    if (_showInfoText) _showInfoText = false;
    notifyListeners();
  }

  Color getContrastColor() {
    final luminance = _backgroundColor.computeLuminance();

    return luminance > 0.5 ? AppColors.lightText : AppColors.white;
  }
}
