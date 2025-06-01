// ignore_for_file: public_member_api_docs

/// Represents the red, green, and blue percentages of a color.
class ColorComposition {
  final double red;
  final double green;
  final double blue;

  const ColorComposition({
    required this.red,
    required this.green,
    required this.blue,
  });

  /// Converts the color percentages to a map of strings.
  Map<String, String> toMap({int decimalPlaces = 0}) => {
    'red': red.toStringAsFixed(decimalPlaces),
    'green': green.toStringAsFixed(decimalPlaces),
    'blue': blue.toStringAsFixed(decimalPlaces),
  };
}
