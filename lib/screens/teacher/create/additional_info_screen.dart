import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../components/custom_buttom.dart';
import 'final_teacher_screen.dart';

class AdditionalInfoScreen extends StatefulWidget {
  final String fullName;
  final String firstName;
  final XFile? profileImage;
  final String teachingDuration;
  final String diploma;
  final List<String> subjects;
  final List<String> departments;
  final List<String> languages;
  final List<String> educationCycles;

  const AdditionalInfoScreen({
    super.key,
    required this.fullName,
    required this.firstName,
    required this.profileImage,
    required this.teachingDuration,
    required this.subjects,
    required this.departments,
    required this.languages,
    required this.educationCycles,
    required this.diploma,
  });

  @override
  State<AdditionalInfoScreen> createState() => _AdditionalInfoScreenState();
}

class _AdditionalInfoScreenState extends State<AdditionalInfoScreen> {
  final TextEditingController bioController = TextEditingController();
  final TextEditingController certificationsController =
      TextEditingController();
  final TextEditingController yearsOfExperienceController =
      TextEditingController();

  @override
  void dispose() {
    bioController.dispose();
    certificationsController.dispose();
    yearsOfExperienceController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final bio = bioController.text.trim();
    final certifications =
        certificationsController.text.split(',').map((e) => e.trim()).toList();
    final yearsOfExperience =
        int.tryParse(yearsOfExperienceController.text) ?? 0;

    if (bio.isEmpty || certifications.isEmpty || yearsOfExperience <= 0) {
      Get.snackbar(
        'Erreur',
        'Veuillez remplir tous les champs correctement.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade300,
        colorText: Colors.white,
      );
      return;
    }

    Get.to(() => FinalTeacherScreen(
          fullName: widget.fullName,
          firstName: widget.firstName,
          profileImage: widget.profileImage,
          teachingDuration: widget.teachingDuration,
          subjects: widget.subjects,
          departments: widget.departments,
          languages: widget.languages,
          bio: bio,
          certifications: certifications,
          yearsOfExperience: yearsOfExperience,
          universitySubjects: const [], // Ajustez selon les besoins
          educationCycle: widget.educationCycles,
          diploma: widget.diploma,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Additional Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: bioController,
              decoration:
                  const InputDecoration(labelText: 'Bio (Parlez de vous)'),
              maxLines: 3,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: certificationsController,
              decoration: const InputDecoration(
                  labelText: 'Certifications (comma-separated)'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: yearsOfExperienceController,
              decoration:
                  const InputDecoration(labelText: 'Years of Experience'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Suivant',
              onPressed: _handleSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
