import 'dart:convert';
import 'package:dev_essentials/presentation/json_formatter/json_formatter_textfield.dart';
import 'package:dev_essentials/widgets/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      const jsonEncoder = JsonEncoder.withIndent('    ');
      final formattedJson = jsonEncoder.convert(jsonObject);
      jsonOutputController.text = formattedJson;
    } catch (e) {
      jsonOutputController.text = '{\n  "Key" : "Value"\n}';
    }
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Texte copié')),
    );
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
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: JsonFormatterTextField(
                        controller: jsonInputController,
                        readOnly: false,
                        hintText: '{ "Key": "Value" }',
                        onCopy: () {
                          copyToClipboard(jsonInputController.text);
                        },
                        onChanged: (value) {
                          formatJson();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gaps.gap10W,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: JsonFormatterTextField(
                        controller: jsonOutputController,
                        readOnly: true,
                        hintText: '{\n  "Key" : "Value"\n}',
                        onCopy: () {
                          copyToClipboard(jsonOutputController.text);
                        },
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
