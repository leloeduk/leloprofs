import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'dart:io';

import 'package:leloprofs/screens/teacher/create/professional_info_screen_part1.dart';
import '../../components/custom_buttom.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final _formKey =
      GlobalKey<FormState>(); // Clé de formulaire pour la validation
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  XFile? profileImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profileImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Information Personnel')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey, // Assign the form key here
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: profileImage == null
                      ? CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.grey[300],
                          child:
                              Icon(Icons.camera_alt, color: Colors.grey[600]),
                        )
                      : CircleAvatar(
                          radius: 100,
                          backgroundImage: foundation.kIsWeb
                              ? NetworkImage(profileImage!
                                  .path) // Use NetworkImage for web
                              : FileImage(File(profileImage!
                                  .path)), // Use FileImage for mobile
                        ),
                ),
                const SizedBox(height: 25),
                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(labelText: 'Votre Nom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nom';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: firstNameController,
                  decoration: const InputDecoration(labelText: 'Votre Prénom'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre prénom';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => ProfessionalInfoScreenPart1(
                            fullName: fullNameController.text,
                            firstName: firstNameController.text,
                            profileImage: profileImage,
                          ));
                    }
                  },
                  title: 'Suivant',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
