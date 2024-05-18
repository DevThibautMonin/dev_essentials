import 'dart:convert';

import 'package:flutter/material.dart';

class JsonFormatterScreen extends StatefulWidget {
  const JsonFormatterScreen({super.key});

  @override
  State<JsonFormatterScreen> createState() => _JsonFormatterScreenState();
}

class _JsonFormatterScreenState extends State<JsonFormatterScreen> {
  final TextEditingController jsonInputController = TextEditingController();
  final TextEditingController jsonOutputController = TextEditingController();

  void formatJson() {
    try {
      final input = jsonInputController.text;
      final jsonObject = json.decode(input);
      const jsonEncoder = JsonEncoder.withIndent('  ');
      final formattedJson = jsonEncoder.convert(jsonObject);
      jsonOutputController.text = formattedJson;
    } catch (e) {
      jsonOutputController.text = '{\n  "Key" : "Value"\n}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      controller: jsonInputController,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      expands: true,
                      decoration: const InputDecoration(border: InputBorder.none, hintText: '{ "Key": "Value" }'),
                      onChanged: (value) {
                        formatJson();
                      },
                    ),
                  )
                ],
              ),
            ),
            const VerticalDivider(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        readOnly: true,
                        controller: jsonOutputController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        expands: true,
                        decoration: const InputDecoration(border: InputBorder.none, hintText: '{\n  "Key" : "Value"\n}'),
                      ),
                    ),
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
