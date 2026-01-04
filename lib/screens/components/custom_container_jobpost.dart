import 'package:flutter/material.dart';

class CustomContainerJobpost extends StatelessWidget {
  const CustomContainerJobpost({
    super.key,
    required this.text,
    required this.color,
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      margin: const EdgeInsets.all(1),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(6), color: color),
      child: Text(
        '  $text',
        style: const TextStyle(
            color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
      ),
    );
  }
}
