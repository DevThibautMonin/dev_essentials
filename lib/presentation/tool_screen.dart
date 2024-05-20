import 'package:dev_essentials/presentation/char_counter/char_counter_screen.dart';
import 'package:dev_essentials/presentation/json_formatter/json_formatter_screen.dart';
import 'package:dev_essentials/presentation/toolbar.dart';
import 'package:dev_essentials/widgets/colors.dart';
import 'package:flutter/material.dart';

class ToolScreen extends StatelessWidget {
  const ToolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Column(
            children: [
              Toolbar(),
            ],
          ),
        ),
        Flexible(
          flex: 8,
          child: Container(
            color: CustomColors.primaryColor,
            child: const Column(
              children: [
                // JsonFormatterScreen(),
                CharCounterScreen()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
