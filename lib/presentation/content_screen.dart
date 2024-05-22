import 'package:dev_essentials/presentation/char_counter/char_counter_screen.dart';
import 'package:dev_essentials/presentation/text_generator/text_generator_screen.dart';
import 'package:dev_essentials/presentation/tools_screen.dart';
import 'package:dev_essentials/presentation/json_formatter/json_formatter_screen.dart';
import 'package:dev_essentials/presentation/toolbar.dart';
import 'package:dev_essentials/widgets/colors.dart';
import 'package:flutter/material.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  String currentWidget = "";

  Widget _buildDynamicWidget() {
    switch (currentWidget) {
      case "ToolsScreen":
        return const ToolsScreen();
      case "JsonFormatterScreen":
        return const JsonFormatterScreen();
      case "CharCounterScreen":
        return const CharCounterScreen();
      case "TextGeneratorScreen":
        return const TextGeneratorScreen();
      default:
        return const ToolsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Column(
            children: [
              Toolbar(
                onToolChanged: (p0) {
                  setState(() {
                    currentWidget = p0;
                  });
                },
              ),
            ],
          ),
        ),
        Flexible(
          flex: 8,
          child: Container(color: CustomColors.primaryColor, child: _buildDynamicWidget()),
        ),
      ],
    );
  }
}
