// ignore_for_file: no_magic_number
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_color_party/app_styles.dart';
import 'package:hello_color_party/color_controller.dart';
import 'package:hello_color_party/home_page.dart';
import 'package:provider/provider.dart';

Color? getBackgroundColor(WidgetTester tester) {
  final container = tester.widget<ColoredBox>(
    find.byKey(const Key('background_container')),
  );

  return container.color;
}

Future<void> pumpHomePage(WidgetTester tester) async {
  await tester.pumpWidget(
    ChangeNotifierProvider(
      create: (_) => ColorController(),
      child: const MaterialApp(home: HomePage()),
    ),
  );
}

void main() {
  group('HomePage', () {
    testWidgets('Initial state has white background and shows info text', (
      WidgetTester tester,
    ) async {
      await pumpHomePage(tester);

      final initialColor = getBackgroundColor(tester);
      expect(initialColor, AppColors.white);

      expect(find.textContaining('Our party is not boring'), findsOneWidget);
    });

    testWidgets('Tapping changes background color and hides info text', (
      WidgetTester tester,
    ) async {
      await pumpHomePage(tester);

      final initialColor = getBackgroundColor(tester);

      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      final newColor = getBackgroundColor(tester);
      expect(newColor != initialColor, true);

      expect(find.textContaining('Our party is not boring'), findsNothing);
    });

    testWidgets(
      'Long press shows color details dialog with valid percentages',
      (WidgetTester tester) async {
        await pumpHomePage(tester);

        await tester.tap(find.byType(GestureDetector));
        await tester.pump();

        await tester.longPress(find.byType(GestureDetector));
        await tester.pumpAndSettle();

        expect(find.text('Color Details'), findsOneWidget);
        expect(find.textContaining('Red:'), findsOneWidget);
        expect(find.textContaining('Green:'), findsOneWidget);
        expect(find.textContaining('Blue:'), findsOneWidget);

        int extractPercentageFromText(Text text) {
          final raw = text.data ?? '';
          final value = raw.replaceAll(RegExp('[^0-9]'), '');

          return int.tryParse(value) ?? 0;
        }

        final redText =
            find.textContaining('Red:').evaluate().first.widget as Text;
        final greenText =
            find.textContaining('Green:').evaluate().first.widget as Text;
        final blueText =
            find.textContaining('Blue:').evaluate().first.widget as Text;

        final red = extractPercentageFromText(redText);
        final green = extractPercentageFromText(greenText);
        final blue = extractPercentageFromText(blueText);

        expect(red, inInclusiveRange(0, 100));
        expect(green, inInclusiveRange(0, 100));
        expect(blue, inInclusiveRange(0, 100));

        final sum = red + green + blue;
        expect(sum, inInclusiveRange(99, 101));

        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle();
        expect(find.text('Color Details'), findsNothing);
      },
    );
  });
}
