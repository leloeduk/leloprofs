import 'package:flutter/material.dart';

class ButtonCircular extends StatefulWidget {
  final String buttonText;
  final Future<void> Function()? onPressed;

  const ButtonCircular({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  _ButtonCircularState createState() => _ButtonCircularState();
}

class _ButtonCircularState extends State<ButtonCircular> {
  bool _isLoading = false;

  void _handleButtonPress() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (widget.onPressed != null) {
        await widget.onPressed!();
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handleButtonPress,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          textStyle: const TextStyle(fontSize: 18),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(widget.buttonText),
      ),
    );
  }
}
