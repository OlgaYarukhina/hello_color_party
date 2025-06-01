// ignore_for_file: public_member_api_docs, no_magic_number

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello_color_party/models/color_composition.dart';

/// Generates random colors and calculates their сomposition.
class ColorGenerator {
  int _red = 255;
  int _green = 255;
  int _blue = 255;
  ColorComposition? _cachedPercentages;

  final Random _random = Random();

  ColorComposition get currentColorComposition =>
      _cachedPercentages ??= _calculateComposition();

  Color generateRandomColor() {
    _red = _random.nextInt(256);
    _green = _random.nextInt(256);
    _blue = _random.nextInt(256);
    _cachedPercentages = null;

    return Color.fromRGBO(_red, _green, _blue, 1.0);
  }

  ColorComposition _calculateComposition() {
    final total = _red + _green + _blue;

    return total == 0
        ? const ColorComposition(red: 0.0, green: 0.0, blue: 0.0)
        : ColorComposition(
            red: (_red / total) * 100,
            green: (_green / total) * 100,
            blue: (_blue / total) * 100,
          );
  }
}
