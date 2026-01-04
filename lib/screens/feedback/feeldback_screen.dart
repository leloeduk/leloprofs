import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/custom_buttom.dart';
import '../drawer/drawer_screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  // Liste des options pour les cases d'utilisateurs
  final List<String> useCase = [
    'aucun',
    'Utilisateur',
    'Enseignant',
    'Ecole',
  ];

  String selectedUseCase = 'aucun'; // Valeur par défaut

  // final FeedbackService _feedbackService = FeedbackService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(
              color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                    child: Text(
                  "Vos Suggestions ",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 16),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                    labelText: 'Entrez votre nom',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                    labelText: 'Entrez votre email',
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Veuillez entrer un email valide';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedUseCase,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800),
                    labelText: "Choisir votre cas d'utilisateur ",
                    border: const OutlineInputBorder(),
                  ),
                  items: useCase.map((cycle) {
                    return DropdownMenuItem<String>(
                      value: cycle,
                      child: Text(cycle),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedUseCase = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                      labelText: 'Votre message '),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre message';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 2),
                CustomButton(
                  title: "Envoyer",
                  onPressed: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      // _feedbackService
                      //     .addFeedback(
                      //   name: nameController.text,
                      //   email: emailController.text,
                      //   userCase: selectedUseCase,
                      //   message: messageController.text,
                      // )
                      //     .then((_) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //         content: Text('Feedback envoyé avec succès !')),
                      //   );
                      //   nameController.clear();
                      //   emailController.clear();
                      //   messageController.clear();
                      //   _formKey.currentState?.reset();
                      //   Get.back();
                      // }).catchError((error) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(
                      //         content: Text(
                      //             'Erreur lors de l\'envoi du feedback: $error')),
                      //   );
                      // });
                    }
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
