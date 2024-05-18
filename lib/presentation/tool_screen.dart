import 'package:dev_essentials/presentation/json_formatter/json_formatter_screen.dart';
import 'package:dev_essentials/presentation/toolbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ToolScreen extends StatelessWidget {
  const ToolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(
          flex: 2,
          child: Column(
            children: [
              Toolbar(),
            ],
          ),
        ),
        Flexible(
          flex: 8,
          child: Column(
            children: [
              JsonFormatterScreen(),
            ],
          ),
        ),
      ],
    );
  }
}
