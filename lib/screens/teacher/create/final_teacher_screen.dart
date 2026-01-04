import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import '../../../controllers/storage_image_controller.dart';
import '../../../controllers/teacher_controller.dart';
import '../../../models/teacher_model.dart';
import '../../components/buttom_circular.dart';

class FinalTeacherScreen extends StatelessWidget {
  final String fullName;
  final String firstName;
  final XFile? profileImage;
  final String teachingDuration;
  final List<String> subjects;
  final List<String> departments;
  final List<String> languages;
  final String bio;
  final List<String> certifications;
  final int yearsOfExperience;
  final List<String> universitySubjects;
  final List<String> educationCycle;
  final String diploma;

  const FinalTeacherScreen({
    super.key,
    required this.fullName,
    required this.firstName,
    required this.profileImage,
    required this.teachingDuration,
    required this.subjects,
    required this.departments,
    required this.languages,
    required this.bio,
    required this.certifications,
    required this.yearsOfExperience,
    required this.universitySubjects,
    required this.educationCycle,
    required this.diploma,
  });

  Future<String?> uploadProfileImage() async {
    if (profileImage != null) {
      final StorageImageController storageImageController =
          Get.put(StorageImageController());
      // Pour Mobile
      final File file = File(profileImage!.path);
      return await storageImageController.uploadFile(
          file, XFile(''), "teachers");
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final TeacherController teacherController = Get.put(TeacherController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Vérifier puis Valider',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade800)),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              profileImage != null
                  ? Center(
                      child: Container(
                        height: 218,
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                                image: FileImage(File(profileImage!.path)),
                                fit: BoxFit.fill)),
                      ),
                    ) // Afficher l'image pour mobile
                  : const Text('No profile image'),
              const SizedBox(height: 10),
              Text('Votre Noms:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(fullName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text('Votre Prémons:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(firstName,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text("Nombre d'année:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(teachingDuration,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text('Départment:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(departments.join(', '),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text('Matières:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(subjects.join(', '),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text('Languages:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(languages.join(', '),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text('Bio:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(bio,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text('Certifications:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(certifications.join(', '),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text("Année d'Expériance",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(yearsOfExperience.toString(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text("Filière d'enseignement à l'université:",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(universitySubjects.join(', '),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text("Education Cycle d'études : ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(educationCycle.join(', '),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              const SizedBox(height: 10),
              Text('Votre Diplomes:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade800)),
              Text(diploma,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey)),
              ButtonCircular(
                  buttonText: "Créer un compte enseignant",
                  onPressed: () async {
                    try {
                      final imageUrl = await uploadProfileImage();
                      final teacher = Teacher(
                        id: FirebaseAuth.instance.currentUser!.uid,
                        fullName: fullName,
                        firstName: firstName,
                        profileImage: imageUrl,
                        teachingDuration: teachingDuration,
                        subjects: subjects,
                        departments: departments,
                        languages: languages,
                        bio: bio,
                        certifications: certifications,
                        yearsOfExperience: yearsOfExperience,
                        universitySubjects: universitySubjects,
                        educationCycle: educationCycle,
                        diploma: diploma,
                      );

                      await teacherController.addTeacher(teacher);
                      Get.snackbar(
                        'Success',
                        'Votre Compte enseignant  a étè creer ',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green.shade300,
                        colorText: Colors.white,
                      );
                    } catch (e) {
                      Get.snackbar(
                        'Erreur',
                        'Une erreur est survenue lors de l\'ajout d\'un enseignant .',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red.shade300,
                        colorText: Colors.white,
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
