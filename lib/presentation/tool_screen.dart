import 'package:dev_essentials/presentation/char_counter/char_counter_screen.dart';
import 'package:dev_essentials/presentation/json_formatter/json_formatter_screen.dart';
import 'package:dev_essentials/presentation/toolbar.dart';
import 'package:dev_essentials/widgets/colors.dart';
import 'package:flutter/material.dart';

class ToolScreen extends StatefulWidget {
  const ToolScreen({super.key});

  @override
  State<ToolScreen> createState() => _ToolScreenState();
}

class _ToolScreenState extends State<ToolScreen> {
  String currentWidget = "";

  Widget _buildDynamicWidget() {
    switch (currentWidget) {
      case "JsonFormatterScreen":
        return const JsonFormatterScreen();
      case "CharCounterScreen":
        return const CharCounterScreen();
      default:
        return const Center(child: Text("Select a tool"));
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
