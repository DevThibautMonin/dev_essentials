import 'package:flutter/material.dart';

class CharCounterCard extends StatefulWidget {
  final String counter;
  final String text;

  const CharCounterCard({
    super.key,
    required this.counter,
    required this.text,
  });

  @override
  State<CharCounterCard> createState() => _CharCounterCardState();
}

class _CharCounterCardState extends State<CharCounterCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.counter,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
