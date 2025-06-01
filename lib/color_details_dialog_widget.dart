import 'package:flutter/material.dart';
import 'package:hello_color_party/models/color_composition.dart';

/// Displays a dialog box with a percentage of colors.
class ColorDetailsDialogWidget extends StatelessWidget {
  /// Percentage composition of the current color
  final ColorComposition percentages;

  /// Create a dialog box with a percentage of colors.
  const ColorDetailsDialogWidget({required this.percentages, super.key});

  @override
  Widget build(BuildContext context) {
    final percentMap = percentages.toMap();

    return AlertDialog(
      title: const Text('Color Details'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Red: ${percentMap['red']}%'),
          Text('Green: ${percentMap['green']}%'),
          Text('Blue: ${percentMap['blue']}%'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
