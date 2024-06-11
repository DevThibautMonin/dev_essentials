import 'package:dev_essentials/commons/enums/tools_enum.dart';
import 'package:dev_essentials/presentation/tools.dart';
import 'package:dev_essentials/commons/colors.dart';
import 'package:dev_essentials/widgets/tool_item.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatefulWidget {
  final Function(ToolsEnum) onToolChanged;
  final String? version;

  const Toolbar({
    super.key,
    required this.onToolChanged,
    this.version,
  });

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  int _selectedIndex = 0;

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
            Text(
              widget.version ?? "",
              style: const TextStyle(color: Colors.white),
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
                      widget.onToolChanged(tools[index].widget);
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
