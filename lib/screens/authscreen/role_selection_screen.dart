import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../school/create/basic_info_screen.dart';
import '../teacher/create/personal_info_screen.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sélectionnez votre rôle'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Créez un compte en tant que:',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            _buildRoleOption(
              context,
              icon: Icons.school,
              label: 'École',
              onPressed: () {
                Get.offAll(() => const BasicInfoScreen());
              },
            ),
            const SizedBox(height: 24),
            _buildRoleOption(
              context,
              icon: Icons.person,
              label: 'Enseignant',
              onPressed: () {
                Get.offAll(() => const PersonalInfoScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleOption(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 28, color: Colors.white),
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'Créer un compte $label',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 3,
      ),
    );
  }
}
