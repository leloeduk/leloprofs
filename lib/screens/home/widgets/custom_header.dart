import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    required this.currentIndex,
    required this.listes,
  });

  final int currentIndex;
  final List<String> listes;

  @override
  Widget build(BuildContext context) {
    // Déterminer les couleurs en fonction de l'index actuel
    final List<Color> gradientColors = currentIndex == 0
        ? [Colors.red.shade100, Colors.red.shade800, Colors.red.shade600]
        : currentIndex == 1
            ? [
                Colors.green.shade100,
                Colors.green.shade800,
                Colors.green.shade600
              ]
            : [
                Colors.blue.shade100,
                Colors.blue.shade800,
                Colors.blue.shade600
              ];

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(8),
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // Ici, nous gardons l'espace pour l'élément image que vous pouvez ajouter plus tard.
          Positioned(
            top: 10,
            left: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hey Profs ,",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    listes[currentIndex],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Action pour le bouton
                    },
                    child: Text(
                      listes[currentIndex],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
