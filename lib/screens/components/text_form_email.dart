import 'package:flutter/material.dart';

class TextFormEmail extends StatefulWidget {
  const TextFormEmail({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;
  @override
  State<TextFormEmail> createState() => _TextFormEmailState();
}

class _TextFormEmailState extends State<TextFormEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.email),
              filled: true,
              fillColor: Colors.white,
              labelText: widget.title),
          validator: (value) {
            if (value == null || value.isEmpty || !value.contains('@')) {
              return 'Please enter a valid email';
            }
            return null;
          },
          onSaved: (value) {
            widget.controller.text = value!;
          },
        ));
  }
}
