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
        decoration: const BoxDecoration(color: Color.fromARGB(255, 6, 90, 134)),
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
                children: const [
                  ToolItem(icon: Icons.code, title: "JSON Formatter"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
