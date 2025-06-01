// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:hello_color_party/app_styles.dart';
import 'package:hello_color_party/color_controller.dart';
import 'package:hello_color_party/color_details_dialog_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorController>(
      builder: (context, controller, _) {
        final backgroundColor = controller.backgroundColor;
        final textColor = controller.getContrastColor();

        return Scaffold(
          body: ColoredBox(
            key:  const Key('background_container'),
            color: backgroundColor,
            child: GestureDetector(
              onTap: controller.changeColor,
              onLongPress: () => showDialog(
                context: context,
                builder: (_) => ColorDetailsDialogWidget(
                  percentages: controller.currentComposition,
                ),
              ),
              behavior: HitTestBehavior.opaque,
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'Hello there',
                      style: AppTextStyles.main(textColor),
                    ),
                  ),
                  if (controller.showInfoText)
                    Positioned.fill(
                      child: Align(
                        alignment: const Alignment(0, 0.5),
                        child: Padding(
                          padding: AppTextStyles.infoTextPadding,
                          child: Text(
                            'Our party is not boring :) \n\n'
                            'Did you know that all the colors you see are '
                            'created mixing just three primary colors:\n'
                            'red, green, and blue?\n\n'
                            'Long press the screen to discover how much of '
                            'each color is in the current shade.\n\n'
                            'Try it now and learn how white light is made. '
                            'Keep tapping to explore more colors!',
                            style: AppTextStyles.info(textColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
