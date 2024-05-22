import 'package:dev_essentials/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextGeneratorScreen extends StatefulWidget {
  const TextGeneratorScreen({super.key});

  @override
  State<TextGeneratorScreen> createState() => _TextGeneratorScreenState();
}

class _TextGeneratorScreenState extends State<TextGeneratorScreen> {
  TextEditingController textController = TextEditingController();
  String _loremIpsum = '';
  double _sentenceCount = 1;

  @override
  void initState() {
    super.initState();
    _loadLoremIpsumText();
  }

  Future<void> _loadLoremIpsumText() async {
    var text = await rootBundle.loadString('assets/data/lorem_ipsum.txt');
    setState(() {
      _loremIpsum = text;
    });
  }

  String _generateRandomText(int sentenceCount) {
    final sentences = _loremIpsum.split(RegExp(r'(?<!\w\.\w.)(?<![A-Z][a-z]\.)(?<=\.|\?)\s'));
    sentences.shuffle();

    final List<String> paragraphs = [];
    for (int i = 0; i < sentenceCount; i += 10) {
      final paragraphSentences = sentences.sublist(i, i + 10).join(' ');
      paragraphs.add(paragraphSentences);
    }

    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ${paragraphs.join('\n\n')}";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Sentences",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Slider(
                value: _sentenceCount,
                min: 1,
                max: 100,
                label: _sentenceCount.round().toString(),
                thumbColor: Colors.white,
                activeColor: CustomColors.secondaryColor,
                onChanged: (value) {
                  setState(() {
                    _sentenceCount = value;
                    textController.text = _generateRandomText(_sentenceCount.round());
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 4,
              child: TextField(
                controller: textController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
