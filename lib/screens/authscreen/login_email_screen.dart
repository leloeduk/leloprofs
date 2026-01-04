import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leloprofs/screens/authscreen/role_selection_screen.dart';

import '../../controllers/auth/auth_email_controller.dart';
import 'registre_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthEmailController authEmailController =
      Get.put(AuthEmailController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Connexion")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Mot de passe"),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                authEmailController.login(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
                await Get.to(() => const RoleSelectionScreen());
              },
              child: const Text("Se connecter"),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Get.to(() => RegisterScreen());
              },
              child: const Text("Créer un compte"),
            ),
          ],
        ),
      ),
    );
  }
}
