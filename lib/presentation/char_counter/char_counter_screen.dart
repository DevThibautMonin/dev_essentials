import 'package:dev_essentials/presentation/char_counter/char_counter_card.dart';
import 'package:flutter/material.dart';

class CharCounterScreen extends StatefulWidget {
  const CharCounterScreen({super.key});

  @override
  State<CharCounterScreen> createState() => _CharCounterScreenState();
}

class _CharCounterScreenState extends State<CharCounterScreen> {
  final TextEditingController textController = TextEditingController();
  int _wordCount = 0;
  int _charCount = 0;
  int _sentenceCount = 0;

  @override
  void initState() {
    super.initState();
    textController.addListener(_updateCounts);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _updateCounts() {
    setState(() {
      _charCount = textController.text.length;
      _wordCount = _countWords(textController.text);
      _sentenceCount = _countSentences(textController.text);
    });
  }

  int _countWords(String text) {
    List<String> words = text.split(RegExp(r'\s+'));

    words.removeWhere((word) => word.isEmpty);

    return words.length;
  }

  int _countSentences(String text) {
    List<String> sentences = text.split(RegExp(r'[.!?]+'));

    sentences.removeWhere((sentence) => sentence.trim().isEmpty);

    return sentences.length;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                color: Colors.white,
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                  maxLines: null,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: CharCounterCard(
                      counter: _charCount.toString(),
                      text: "Characters",
                    ),
                  ),
                  Expanded(
                    child: CharCounterCard(
                      counter: _wordCount.toString(),
                      text: "Words",
                    ),
                  ),
                  Expanded(
                    child: CharCounterCard(
                      counter: _sentenceCount.toString(),
                      text: "Sentences",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
