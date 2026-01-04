import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, this.onPressed, required this.title});
  final String title;
  final Future<void> Function()? onPressed;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  void _handlePress() async {
    if (widget.onPressed != null) {
      setState(() {
        _isLoading = true;
      });

      try {
        // Appeler la fonction onPressed
        await widget.onPressed!();
      } catch (e) {
        // Gérer les erreurs ici si nécessaire
        print('Erreur : $e');
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Le bouton sera masqué lorsqu'il est en cours de chargement
        if (!_isLoading)
          Center(
            child: ElevatedButton(
              onPressed: _handlePress,
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade500),
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        // L'indicateur de chargement sera centré lorsqu'il est en cours de chargement
        if (_isLoading)
          Positioned.fill(
            child: Center(
              child: Container(
                color: Colors
                    .black54, // Optionnel : Ajoute un fond semi-transparent
                child: CircularProgressIndicator(
                  color: Colors.red.shade800,
                  strokeWidth: 8,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
