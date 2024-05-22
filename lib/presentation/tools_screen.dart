import 'package:dev_essentials/presentation/tools.dart';
import 'package:flutter/material.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 5,
              children: List.generate(
                tools.length,
                (index) {
                  return Center(
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              tools[index].title,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Icon(
                                tools[index].icon,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
