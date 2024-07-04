import 'package:flutter/material.dart';

class JsonFormatterTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final String hintText;
  final VoidCallback onCopy;
  final ValueChanged<String>? onChanged;

  const JsonFormatterTextField({
    super.key,
    required this.controller,
    required this.readOnly,
    required this.hintText,
    required this.onCopy,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            expands: true,
            decoration: InputDecoration(border: InputBorder.none, hintText: hintText, contentPadding: const EdgeInsets.all(10)),
            onChanged: onChanged,
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            icon: const Icon(Icons.copy),
            onPressed: onCopy,
          ),
        ),
      ],
    );
  }
}
