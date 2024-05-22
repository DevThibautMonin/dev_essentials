import 'package:dev_essentials/presentation/char_counter/char_counter_screen.dart';
import 'package:dev_essentials/presentation/text_generator/text_generator_screen.dart';
import 'package:dev_essentials/presentation/tools_screen.dart';
import 'package:dev_essentials/presentation/json_formatter/json_formatter_screen.dart';
import 'package:flutter/material.dart';

List<Tool> tools = [
  const Tool(title: "All Tools", icon: Icons.list, widget: ToolsScreen()),
  const Tool(title: "JSON Formatter", icon: Icons.code, widget: JsonFormatterScreen()),
  const Tool(title: "Char Counter", icon: Icons.onetwothree, widget: CharCounterScreen()),
  const Tool(title: "Text Generator", icon: Icons.text_increase, widget: TextGeneratorScreen()),
];

class Tool {
  final String title;
  final IconData icon;
  final Widget widget;

  const Tool({
    required this.title,
    required this.icon,
    required this.widget,
  });
}
