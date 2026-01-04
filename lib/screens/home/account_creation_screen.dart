import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leloprofs/screens/home/home_screen.dart';

import '../school/create/basic_info_screen.dart';

class AccountCreationScreen extends StatelessWidget {
  const AccountCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un Compte'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigation vers l'écran de création de compte pour les enseignants
                  // Get.to(const PersonalInfoScreen());
                },
                child: const Text('Créer un Compte Enseignant'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigation vers l'écran de création de compte pour les écoles
                  Get.to(const BasicInfoScreen());
                },
                child: const Text('Créer un Compte École'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigation vers l'écran de création de compte pour les administrateurs
                  // Get.to(CreateJobPostScreen());
                },
                child: const Text('Créer un poste '),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigation vers l'écran de création de compte pour les administrateurs
                  Get.to(const HomeScreen());
                },
                child: const Text('Home '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
