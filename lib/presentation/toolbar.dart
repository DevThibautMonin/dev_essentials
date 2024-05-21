import 'package:dev_essentials/presentation/char_counter/char_counter_screen.dart';
import 'package:dev_essentials/presentation/json_formatter/json_formatter_screen.dart';
import 'package:dev_essentials/widgets/colors.dart';
import 'package:dev_essentials/widgets/tool_item.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatefulWidget {
  final Function(String) onToolChanged;

  const Toolbar({
    super.key,
    required this.onToolChanged,
  });

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  int _selectedIndex = 0;
  List<Tool> tools = [
    const Tool(title: "JSON Formatter", icon: Icons.code, widget: JsonFormatterScreen()),
    const Tool(title: "Char Counter", icon: Icons.onetwothree, widget: CharCounterScreen()),
  ];

  void onToolSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(color: CustomColors.primaryColor),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "DevEssentials",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tools.length,
                itemBuilder: (context, index) {
                  return ToolItem(
                    icon: tools[index].icon,
                    title: tools[index].title,
                    isSelected: _selectedIndex == index,
                    onTap: () {
                      onToolSelected(index);
                      widget.onToolChanged(tools[index].widget.toString());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
