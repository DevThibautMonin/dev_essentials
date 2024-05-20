import 'package:dev_essentials/widgets/colors.dart';
import 'package:dev_essentials/widgets/tool_item.dart';
import 'package:flutter/material.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({super.key});

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
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
              child: ListView(
                children: [
                  ToolItem(
                    icon: Icons.code,
                    title: "JSON Formatter",
                    isSelected: false,
                    onTap: () {},
                  ),
                  ToolItem(
                    icon: Icons.onetwothree,
                    title: "Char Counter",
                    isSelected: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
