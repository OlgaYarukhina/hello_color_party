import 'package:flutter/material.dart';
import 'package:hello_color_party/color_controller.dart';
import 'package:hello_color_party/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ColorController(),
      child: const MaterialApp(title: 'Colors Learning App', home: HomePage()),
    ),
  );
}
