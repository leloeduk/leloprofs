import 'package:flutter/material.dart';

class TextFormPassword extends StatefulWidget {
  const TextFormPassword({
    super.key,
    required this.title,
    required this.controller,
  });
  final String title;
  final TextEditingController controller;

  @override
  State<TextFormPassword> createState() => _TextFormPasswordState();
}

class _TextFormPasswordState extends State<TextFormPassword> {
  String password = "";
  bool show = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: TextFormField(
        controller: widget.controller,
        obscureText: show,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.key),
            suffixIcon: show
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: const Icon(Icons.key_off))
                : IconButton(
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    icon: const Icon(Icons.key)),
            filled: true,
            fillColor: Colors.white,
            labelText: widget.title),
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 6) {
            return 'Password must be at least 6 characters long';
          }
          return null;
        },
        onSaved: (value) {
          widget.controller.text = value!;
        },
      ),
    );
  }
}
