import 'package:dev_essentials/commons/gaps.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final TextEditingController textEditingController = TextEditingController();
  String? textFieldValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextField(
              minLines: 5,
              maxLines: 10,
              decoration: const InputDecoration(
                hintText: "Type your content here !",
                contentPadding: EdgeInsets.all(10),
              ),
              controller: textEditingController,
              onChanged: (value) {
                setState(() {
                  textFieldValue = value;
                });
              },
            ),
          ),
        ),
        Gaps.gap15H,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: QrImageView(
              data: textFieldValue ?? "",
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
