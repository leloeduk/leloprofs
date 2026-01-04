import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth/auth_email_controller.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthEmailController authEmailController =
      Get.find<AuthEmailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inscription")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Mot de passe"),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                authEmailController.register(
                  emailController.text.trim(),
                  passwordController.text.trim(),
                );
              },
              child: Text("S'inscrire"),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Déjà un compte ? Se connecter"),
            ),
          ],
        ),
      ),
    );
  }
}
