import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/school_controller.dart';
import '../../../controllers/storage_image_controller.dart';
import '../../../models/school_model.dart';
import '../../components/buttom_circular.dart';
import '../../home/home.dart';

class FinalSchoolScreen extends StatelessWidget {
  FinalSchoolScreen({
    super.key,
    required this.name,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.profileImage,
    required this.types,
    required this.department,
    required this.educationCycles,
    this.ratings,
  });

  final String name;
  final String address;
  final String email;
  final String phoneNumber;
  final String profileImage;
  final List<String> types;
  final String department;
  final List<String> educationCycles;
  final double? ratings;

  final SchoolController _schoolController = Get.put(SchoolController());
  Future<String?> uploadProfileImage() async {
    final StorageImageController storageImageController =
        Get.put(StorageImageController());
    // Pour Mobile
    final File file = File(profileImage);
    return await storageImageController.uploadFile(file, XFile(''), "schools");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirmation des infos ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red.shade800,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              if (profileImage.isNotEmpty)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(profileImage),
                      height: 150,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ), // Afficher l'image pour mobile
              const SizedBox(height: 10),
              Text(
                'Nom de l\'école:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade800,
                ),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Adresse:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade800,
                ),
              ),
              Text(
                address,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Numéro de téléphone:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade800,
                ),
              ),
              Text(
                phoneNumber,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Types d\'école:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade800,
                ),
              ),
              Text(
                types.join(', '),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Départements:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade800,
                ),
              ),
              Text(
                department,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Cycles d\'enseignement:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade800,
                ),
              ),
              Text(
                educationCycles.join(', '),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey,
                ),
              ),
              if (ratings != null) ...[
                const SizedBox(height: 10),
                Text(
                  'Évaluation:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade800,
                  ),
                ),
                Text(
                  ratings!.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              ButtonCircular(
                buttonText: "Créer un compte école",
                onPressed: () async {
                  var image = await uploadProfileImage();
                  try {
                    final school = School(
                      id: FirebaseAuth.instance.currentUser!.uid,
                      name: name,
                      address: address,
                      email: FirebaseAuth.instance.currentUser!.email,
                      phoneNumber: phoneNumber,
                      profileImage: image,
                      types: types,
                      department: department,
                      educationCycle: educationCycles,
                      ratings: ratings,
                    );

                    Get.to(() => const Home());
                    await _schoolController.addSchool(school);
                    Get.snackbar(
                      'Success',
                      'Votre Compte école a étè creer ',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green.shade300,
                      colorText: Colors.white,
                    );
                  } catch (e) {
                    Get.snackbar(
                      'Erreur',
                      'Une erreur est survenue lors de l\'ajout de l\'école.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.shade300,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
