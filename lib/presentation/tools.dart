import 'package:dev_essentials/commons/enums/tools_enum.dart';
import 'package:flutter/material.dart';

List<Tool> tools = [
  const Tool(title: "All Tools", icon: Icons.list, widget: ToolsEnum.tools),
  const Tool(title: "JSON Formatter", icon: Icons.code, widget: ToolsEnum.jsonFormatter),
  const Tool(title: "Char Counter", icon: Icons.onetwothree, widget: ToolsEnum.charCounter),
  const Tool(title: "Text Generator", icon: Icons.text_increase, widget: ToolsEnum.textGenerator),
];

class Tool {
  final String title;
  final IconData icon;
  final ToolsEnum widget;

  const Tool({
    required this.title,
    required this.icon,
    required this.widget,
  });
}
