import 'package:dev_essentials/widgets/gaps.dart';
import 'package:flutter/material.dart';

class ToolItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ToolItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 21, 131, 190),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Gaps.gap15W,
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
